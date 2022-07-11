#!/usr/bin/env bash

source ~/.config/zsh/exports.zsh

RED='\033[0;31m'          # Red     -> Error
GREEN='\033[0;32m'        # Green   -> Success
BLUE='\033[0;34m'         # Blue    -> Information
YELLOW='\033[0;33m'       # Yellow  -> Class name
NC='\033[0m' # No Color

# list_grades() {
# }
#
# list_semesters() {
# }

# Do all of the checking before copying the assignments over to each class.
copy_assignments() {
  if [[ -f "${1}" ]]; then
    for unit in `ls ${2}/assignments/pdf-files/`; do
      cp -r "${3}/${unit}" "${1}"
    done
  else
    mkdir -p "${1}"
    for unit in `ls ${2}/assignments/pdf-files/`; do
      cp -r "${3}/${unit}" "${1}"
    done
  fi
}

# Function for bringing the notes for each class and organizing them into their
# respective folders.
bring_notes() {
  # Iterate through each class
  for class in `find ${ROOT} -maxdepth 1`; do
    # Check if the class is a directory
    if [[ -d ${class} ]]; then
      # Check if the current class that we are on isn't the current folder
      # that holds all of the classes: ex
      # ['./', 'hs-algebra-2', 'hs-english-2', 'hs-geometry-2', 'hs-physics-2']
      # If we are on the './', it will ignore that.
      if [[ $(basename ${class}) != $(basename ${ROOT}) ]]; then
        # If there is a file called `master.pdf`, we are going to copy it over
        if [[ -f "${class}/master.pdf" ]]; then
          # Create the needed variables
          grade=$(basename ${CURRENT_GRADE}) # The grade
          semester=$(basename ${ROOT}) # The semester
          info_file="${class}/info.yaml" # The info file for the class
          current_class="$(basename ${class})" # The name of the class
          class_path="${grade}/${semester}/${current_class}" # The path to the class
          class_name=$(cat "${info_file}" | shyaml get-value title) # The class name
          # Echo helpful information
          echo -e "${BLUE}Getting the notes for class${NC}: ${YELLOW}${class_name}${NC}." # Print that we are getting the notes for the class

          # This checks if we don't have the folder for the current grade in here
          if [[ -f "${class_path}" ]]; then
            # If we have the folder, we are going to copy the notes over
            cp "${class}/master.pdf" "${class_path}/master.pdf"
          else
            # Since we don't have the folder, we are going to create it
            # and copy the notes over
            mkdir -p "${class_path}"
            cp "${class}/master.pdf" "${class_path}/master.pdf"
          fi
        # If we cannot find the `master.pdf` file, we're going to print an error
        else
          # Echo helpful information
          echo -e "${RED}No${NC} ${YELLOW}master.pdf${NC} ${RED}found for class${NC}: ${YELLOW}${class_name}${NC}."
          return 0
        fi
      fi
    fi
  done

  echo -e "${GREEN}Done${NC}."
}

# Function for bringing all of the assignments for each class and organizing
# them into their respective folders.
bring_assignments() {
  for class in `find ${ROOT}/ -maxdepth 1`; do
    if [[ -d ${class} ]]; then
      if [[ $(basename ${class}) != $(basename ${ROOT}) ]]; then
        if [[ -d "${class}/assignments" ]]; then
          # Create the needed variables
          info_file="${class}/info.yaml" # The info file for the class
          current_class=$(basename ${class}) # The class folder name
          class_name=$(cat "${info_file}" | shyaml get-value title) # The class name
          current_path="${grade}/${semester}/${current_class}" # The path to the class
          grade=$(basename ${CURRENT_GRADE}) # The grade
          semester=$(basename ${ROOT}) # The semester
          assignments_path="${grade}/${semester}/${current_class}/assignments" # The path to the assignments
          class_assignments_path="${class}/assignments/pdf-files" # The path to the assignments

          # Echo helpful information
          echo -e "${BLUE}Getting the assignments for class${NC}: ${YELLOW}${class_name}${NC}."

          # Copy the assignments over
          copy_assignments "${assignments_path}" "${class}" "${class_assignments_path}"

          # Echo helpful information
          echo -e ${GREEN}"Done copying assignments for class${NC}: ${YELLOW}${class_name}${NC}."}
          echo -e "${BLUE}Zipping up the assignments for class${NC}: ${YELLOW}${class_name}${NC}."

          # Zip up the assignments
          zip -r "${current_path}/assignments.zip" "${current_path}/assignments"

          # Echo helpful Information
          echo -e ${GREEN}"Done zipping up the assignments for class${NC}: ${YELLOW}${class_name}${NC}."}
        else
          echo -e "${GREEN}No${NC} ${RED}assignments${NC} ${GREEN}found for class${NC}: ${RED}${class_name}${NC}."
          exit
        fi
      fi
    fi
  done

  echo -e "${BLUE}Done${NC}."
}

user_input_for_grade() {
  # Asking for the user if they want to bring the notes and/or assignments
  # from another grade
  # If the user inputs: (d), the program will use the default grade.
  # Otherwise, it will use the user input.
  current_grade=$(basename ${CURRENT_GRADE})
  read -e -p "Enter your grade (d = default: ${current_grade}): " grade

  if [[ ${grade} != "d" ]]; then
    # Check if the grade doesn't exist. If it doesn't, then print an error
    # and exit.
    if [[ ! -d "${NOTES_DIR}/${grade}" ]]; then
      echo -e "${RED}Grade${NC}: ${YELLOW}${grade}${NC} ${RED}does not exist.${NC}"
      exit
    fi

    current_grade=${grade}
  fi
}

user_input_for_semester() {
  # Asking for the user if they want to bring the notes and/or assignments
  # from another semester
  # If the user inputs: (d), the program will use the default semester.
  # Otherwise, it will use the user input.
  current_semester=$(basename ${ROOT})
  read -e -p "Enter your semester (d = default: ${current_semester}): " semester

  if [[ ${semester} != "d" ]]; then
    # Check if the semester doesn't exist. If it doesn't, then print an error
    # and exit.
    if [[ ! -d "${CURRENT_GRADE}/${semester}" ]]; then
      echo -e "${RED}Semester${NC}: ${YELLOW}${semester}${NC} ${RED}does not exist.${NC}"
      exit
    fi

    current_semester=${semester}
  fi
}

user_input_for_grade
CURRENT_GRADE="${NOTES_DIR}/${current_grade}"
# echo ""
user_input_for_semester
ROOT="${CURRENT_GRADE}/${current_semester}"

echo -e "${YELLOW}Bringing notes...${NC}"
bring_notes
echo ""
echo ""
echo -e "${YELLOW}Bringing assignments...${NC}"
bring_assignments
