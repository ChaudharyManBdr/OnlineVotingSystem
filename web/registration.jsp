<%-- 
    Document   : index
    Created on : Jun 24, 2014, 3:50:50 PM
    Author     : Manav
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Online Voting</title>

        <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />

        <script src="css/SpryAssets/SpryValidationTextField.js" type="text/javascript"></script>
        <link href="css/SpryAssets/SpryValidationTextField.css" rel="stylesheet" type="text/css" />

    </head>
    <body>
        <!-- wrapper starts -->
        <div class="wrapper"> 

            <!-- Header Starts -->
            <div class="header">
                <div class="header-container">
                    <div class="logo"> <a href="#"><b>Online Voting System</b></a> </div>
                    <div class="toll-free">
                        <p>Call us at : 9841483963</p>
                    </div>
                    <div class="clear"></div>
                </div>
            </div>
            <!-- Header ends --> 

            <!-- Nav start -->
            <div class="nav">
                <div class="nav-in">
                    <ul>
                        <li class="last"><a href="index.jsp">Home </a></li>
                        <li><a href="registration.jsp">Registration </a></li>
                        <li><a href="voterId.jsp"> Voter-ID</a></li>
                        <li><a href="voting.jsp">Voting </a></li>
                        <li><a href="contactUs.jsp">Contact us </a></li>

                    </ul>
                    <div class="clear"></div>
                </div>
            </div>
            <!-- Nav end --> 

            <!-- maincontent Starts -->
            <div class="form_registration">

                <h3>Registration Form</h3><br/>
                <table width="665" height="100" border="1">

                    <tr>
                        <td height="101" align="center">
                            <form action="UploadServlet" method="post" enctype="multipart/form-data" name="form1" id="form1">
                                </br> <p class="form_registration_p">Please ! Proceed Further Only After Submitting Your CitizenShip Soft Copy.</p></br></br>
                                <p>

                                    CitizenShihp No. : <input type="text" name="citizen_no" size="20" required="" style="font-size:14pt;height:25px">

                                </p></br></br>
                                <p>CitizenShip Soft Copy : 
                                    <label for="pic"></label>
                                    <input type="file" name="photo" value="submit" required="" class="btn btn-primary">
                                    .JPG format  </br>
                                    Size (500*400 pixel)</p></br></br>
                                <p>
                                    <button type="submit"  class="btn btn-success" >Proceed Next</button>
                                </p></br></br>
                                <p class="form_registration_k">
                                    <%= request.getAttribute("Message")%>
                                </P>
                                 
                            </form>
                            <p>&nbsp;</p></td>
                    </tr>
                </table></br></br>

                <table width="918" height="568" border="0">

                    <form action="Registration" method="get" enctype="multipart/form-data">
                        <tr>
                            <td width="158">CitizenShip No. :</td>
                            <td width="233"><span id="cit">
                                    <label for="citizen_no"></label>
                                    <span id="citizen_no">
                                        <label for="cit"></label>
                                        <input type="text" name="citizen_no" size="20" required="" style="font-size:14pt;height:25px"/> <%= request.getAttribute("citizenShipNo")%>
                                        <br />
                                        <span class="textfieldRequiredMsg">A value is required.</span><span class="textfieldMinCharsMsg">Minimum number of characters not met.</span><span class="textfieldMaxCharsMsg">Exceeded maximum number of characters.</span></span>                                  <span class="textfieldMaxCharsMsg">.</span></span></td>
                            <td width="270">&nbsp;</td>
                            <td width="239">&nbsp;</td>
                        </tr>
                        <tr>
                            <td>Name :</td>
                            <td><p>First Name : <span id="fnam1">
                                        <label for="fname"></label>
                                        <label for="sf"></label>
                                        <input type="text" name="fname" required="" style="font-size:14pt;height:25px" />
                                        <br />
                                    </span></p></td>
                            <td>Middle Name : <span id="mname">
                                    <label for="m"></label>
                                    <label for="as"></label>
                                    <input type="text" name="mname" id="as" style="font-size:14pt;height:25px"/>
                                    <br />
                                </span></td>
                            <td>Last Name : <span id="lname">
                                    <label for="lname"></label>
                                    <label for="we"></label>
                                    <input type="text" name="lname" id="we" required="" style="font-size:14pt;height:25px" />
                                </span></td>
                        </tr>
                        <tr>
                            <td>Date Of Birth :</td>
                            <td><span id="dateofbirth">
                                    <label for="dob"></label>
                                    yyyy-mm-dd
                                    <span id="date">
                                        <input type="text" name="dob" id="dob"  size="20" required="" style="font-size:14pt;height:25px"/>
                                        A.D.<br />
                                        <span class="textfieldRequiredMsg">A value is required.</span><span class="textfieldInvalidFormatMsg">Invalid format.</span></span></span></td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>Gender :</td>
                            <td><input name="gender" type="radio" id="r" value="Male" checked="checked"  />
                                <label for="r"></label> 
                                Male       <input type="radio" name="gender" id="fe" value="Female" />
                                <label for="fe"> Female</label></td>
                            <td><label for="re"></label></td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>E-mail :</td>
                            <td><span id="email">
                                    <label for="em"></label>
                                </span>
                                <label for="em2"></label>
                                <span id="ema">
                                    <input type="text" name="email" id="em2" size="30" placeholder="Please enter only valid email !"required="" style="font-size:14pt;height:25px" />
                                    <span class="textfieldRequiredMsg">A value is required.</span><span class="textfieldInvalidFormatMsg">Invalid format.</span><span class="textfieldMinCharsMsg">Minimum number of characters not met.</span><span class="textfieldMaxCharsMsg">Exceeded maximum number of characters.</span></span></td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>Permanent Address </td>
                            <td>District : <span id="district">
                                    <label for="dis"></label>
                                    <input type="text" name="district" id="dis" size="25"required="" style="font-size:14pt;height:25px" />
                                    <br />
                                </span></td>
                            <td>VDC/Municipality: <span id="vdc">
                                    <label for="vd"></label>
                                    <input type="text" name="vdc" id="vd" size="25"required="" style="font-size:14pt;height:25px" />
                                    <br />
                                </span></td>
                            <td align="left">Ward No. : <span id="ward">
                                    <label for="wa"></label>
                                    <input type="text" name="ward" id="wa"  required="" style="font-size:14pt;height:25px"/>
                                </span></td>
                        </tr>
                        <tr>
                            <td>Constituency No. :</td>
                            <td><span id="consti">
                                    <label for="cons"></label>
                                    <input type="text" name="constituency" size="15"required="" style="font-size:14pt;height:25px"/>
                                    <br />
                                </span></td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>


                        <tr>
                            <td align="center">&nbsp;</td>
                            <td align="center"><button type="submit" class="btn btn-primary" >Submit</button></td>
                            <td align="left"><button type="reset" class="btn btn-default" >Cancel</button></td>
                            <td>&nbsp;</td>
                        </tr>
                    </form>
                </table>
                <div class="clear"></div>

            </div>
            <!-- aincontent ends --> 



            <!-- footer starts -->
            <div class="footer">
                <div class="footer-in">
                    <div class="social-icons">
                        <ul>
                            <li><a href="#"><img src="images/face-book.png" width="16" height="16" alt="img" /></a></li>
                            <li><a href="#"><img src="images/twitter.png" width="16" height="16" alt="img" /></a></li>
                            <li class="last"><a href="#"><img src="images/google.png" width="16" height="16" alt="img" /></a></li>
                        </ul>
                        <div class="clear"></div>
                    </div>
                    <div class="copy">
                          <p>Copyright © 2014 On-line Voting System. All rights reserved. Developed by <a href="#" >Minor Project Group 2068/BCT 'A' HCOE </a></p>
                    </div>
                    <div class="clear"></div>
                </div>
            </div>
            <!-- footer ends --> 

        </div>
        <!-- wrapper ends -->


        <script type="text/javascript">
            var sprytextfield1 = new Spry.Widget.ValidationTextField("citizen_no", "none", {validateOn: ["blur"], minChars: 1, maxChars: 50});
            var sprytextfield2 = new Spry.Widget.ValidationTextField("fname", "none", {minChars: 1, maxChars: 50, isRequired: false});
            var sprytextfield3 = new Spry.Widget.ValidationTextField("lnam", "none", {validateOn: ["blur"], minChars: 1, maxChars: 50});
            var sprytextfield5 = new Spry.Widget.ValidationTextField("date", "date", {validateOn: ["blur"], format: "yyyy-mm-dd"});
            var sprytextfield6 = new Spry.Widget.ValidationTextField("ema", "email", {minChars: 1, maxChars: 50, validateOn: ["blur"]});
        </script>
    </body>
</html>
