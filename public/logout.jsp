<%

Cookie cookie = new Cookie ("apolloUser","");
cookie.setMaxAge(0);
cookie.setPath("/");
response.addCookie(cookie);
session.invalidate();
response.sendRedirect("index.jsp");
%>