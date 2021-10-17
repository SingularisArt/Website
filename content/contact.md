---
title:    "Contact Me"
date:     2021-10-13
---

<style>
  @import url(https://fonts.googleapis.com/css?family=Montserrat:400,700);

  form { max-width:420px; margin:50px auto; }

  .feedback-input {
    color:white;
    font-family: Helvetica, Arial, sans-serif;
    font-weight:500;
    font-size: 18px;
    border-radius: 5px;
    line-height: 22px;
    background-color: transparent;
    border:2px solid #CC6666;
    transition: all 0.3s;
    padding: 13px;
    margin-bottom: 15px;
    width:100%;
    box-sizing: border-box;
    outline:0;
    color: #CC6666;
  }

  .feedback-input:focus { border:2px solid #CC4949; }

  textarea {
    height: 150px;
    line-height: 150%;
    resize:vertical;
  }

  [type="submit"] {
    font-family: 'Montserrat', Arial, Helvetica, sans-serif;
    width: 100%;
    background:#CC6666;
    border-radius:5px;
    border:0;
    cursor:pointer;
    color:white;
    font-size:24px;
    padding-top:10px;
    padding-bottom:10px;
    transition: all 0.3s;
    margin-top:-4px;
    font-weight:700;
  }
  [type="submit"]:hover { background:#CC4949; }
</style>

<form accept-charset="UTF-8" action="https://getform.io/f/2c8a60d5-26ed-48cc-9b3a-0bfc76d9179b" METHOD="POST">
  <input    name="Name"          type="text"  class="feedback-input" placeholder="Name"         required  />   
  <input    name="Email"         type="email" class="feedback-input" placeholder="Email"        required  />
  <input    name="Phone Number"  type="tel"   class="feedback-input" placeholder="Phone Number"           />
  <select   name="Options"       type="text"  class="feedback-input">
    <option value="Suggestion"   type="text"  selected>Suggestion </option>
    <option value="Typo"         type="text">          Typo       </option>
    <option value="Bug"          type="text">          Bug        </option>
    <option value="Other"        type="text">          Other      </option>
  </select>
  <textarea name="text"          type="text"  class="feedback-input" placeholder="Comment"></textarea>
  <input    name="Submit"        type="submit"                       value="SUBMIT"/>
</form>