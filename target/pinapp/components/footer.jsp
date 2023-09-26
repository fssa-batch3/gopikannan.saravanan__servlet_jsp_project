<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/footer.css" />
</head>
<body>

 <div class="footer">
    <div class="footmain">
        <div class="footerpart">
            <div class="foot-head"><p>Donate now</p></div>
            <div class="foot-link">
                <ul>
                    <li><a href="../../webpage/donate/donateFilter.html?cause=Medical">Medical </a></li>
                    <li><a href="../../webpage/donate/donateFilter.html?cause=Educational">Education</a></li>
                    <li><a href="../../webpage/donate/donateFilter.html?cause=Socialcause">Social causes</a></li>
                </ul>
            </div>
        </div>

        <div class="footerpart">
            <div class="foot-head"><p>How it works?</p></div>
            <div class="foot-link">
                <ul>
                    <li><a href="#">What is Crowdfunding?</a></li>
                    <li><a href="#">Fundraising Tips</a></li>
                    <li><a href="../../webpage/fundraiser/successfullfundraise.html">Browse Successful fundraises</a></li>
                    <li><a href="#">Careers</a></li>
                </ul>
            </div>
        </div>

        <div class="footerpart">
            <div class="foot-head"><p>Support</p></div>
            <div class="foot-link">
                <ul>
                    <li><a href="target">FAQ's & Help Center</a></li>
                    <li><a href="#">Are Pin campaigns Genuine?</a></li>
                    <li><a href="#">Trust & Safety</a></li>
                    <li><a href="#">Featured In</a></li>
                </ul>
            </div>
        </div>
    </div>

    <div class="foot-last">
        <div class="foot-end">
            <img id="mail" src="<%= request.getContextPath() %>/assets/images/mail.png" alt="mail" />
            <p>Sign Up for PIN News</p>
            <button class="subscribe">Subscribe</button>
        </div>
        <div class="foot-logo">
            <p id="logo-txt">Follow PIN</p>
            <a href="#"><img class="logo-icon" src="<%= request.getContextPath() %>/assets/images/fb.png" alt="facebook" /></a>
            <a href="#"><img class="logo-icon" src="<%= request.getContextPath() %>/assets/images/twitter.png" alt="twitter" /></a>
            <a href="#"><img class="logo-icon" src="<%= request.getContextPath() %>/assets/images/insta.png" alt="instagram" /></a>
            <a href="#"><img class="logo-icon" src="<%= request.getContextPath() %>/assets/images/youtube.png" alt="youtube" /></a>
        </div>
    </div>
    </div>
</body>
</html>
