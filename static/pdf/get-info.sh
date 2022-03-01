#!/usr/bin/env bash

source ~/.config/zsh/exports.zsh

RED='\033[0;31m'          # Red     -> Error
GREEN='\033[0;32m'        # Green   -> Success
BLUE='\033[0;34m'         # Blue    -> Information
YELLOW='\033[0;33m'       # Yellow  -> Class name
NC='\033[0m' # No Color

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
  for class in `find ${ROOT} -maxdepth 1`; do
    if [[ -d ${class} ]]; then
      info_file="${class}/info.yaml"
      current_class=$(basename ${class})
      class_path="${grade}/${semester}/${current_class}"
      grade=$(basename ${CURRENT_GRADE})
      semester=$(basename ${ROOT})

      if [[ $(basename ${class}) != $(basename ${ROOT}) ]]; then
        if [[ -f "${class}/master.pdf" ]]; then
          class_name=$(cat "${info_file}" | shyaml get-value title)
          echo -e "${BLUE}Getting the notes for class${NC}: ${YELLOW}${class_name}${NC}."

          if [[ -f "${class_path}" ]]; then
            cp "${class}/master.pdf" "${class_path}/master.pdf"
          else
            mkdir -p "${class_path}"
            cp "${class}/master.pdf" "${class_path}/master.pdf"
          fi
        else
          echo -e "${RED}No${NC} ${YELLOW}master.pdf${NC} ${RED}found for class${NC}: ${YELLOW}${class_name}${NC}."
          exit
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
      current_class=$(basename ${class})
      class_name=$(cat "${info_file}" | shyaml get-value title)
      current_path="${grade}/${semester}/${current_class}"
      grade=$(basename ${CURRENT_GRADE})
      semester=$(basename ${ROOT})
      assignments_path="${grade}/${semester}/${current_class}/assignments"
      class_assignments_path="${class}/assignments/pdf-files"

      if [[ $(basename ${class}) != $(basename ${ROOT}) ]]; then
        if [[ -d "${class}/assignments" ]]; then
          info_file="${class}/info.yaml"

          echo -e "${BLUE}Getting the assignments for class${NC}: ${YELLOW}${class_name}${NC}."

          copy_assignments "${assignments_path}" "${class}" "${class_assignments_path}"

          echo -e ${GREEN}"Done copying assignments for class${NC}: ${YELLOW}${class_name}${NC}."}
          echo -e "${YELLOW}Zipping assignments...${NC}"

          zip -r "${current_path}/assignments.zip" "${current_path}/assignments" 

          echo -e "${BLUE}Done zipping assignments for class${NC}: ${RED}${class_name}${NC}."
          echo ""
        else
          echo -e "${GREEN}No${NC} ${RED}assignments${NC} ${GREEN}found for class${NC}: ${RED}${class_name}${NC}."
          exit
        fi
      fi
    fi
  done

  echo -e "${BLUE}Done${NC}."
}

echo -e "${YELLOW}Bringing notes...${NC}"
bring_notes
echo ""
echo ""
echo -e "${YELLOW}Bringing assignments...${NC}"
bring_assignments
