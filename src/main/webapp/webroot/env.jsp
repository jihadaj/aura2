<%@ page import="geospaces.TextFile" %>
<%@include file="include1.jsp" %>

<%!
    private static String [] ids = {
            "id", "ver", "lat", "lon", "alt", "direction", "time", "temperature",
            "humidity", "smoke"
    };
    TextFile csv = new TextFile("ENV.csv", ids);
%>
<%
    String apiKey = ((String) getParam("api_key", request, "")).toLowerCase();
    StringBuilder sb = new StringBuilder(256);

    csv.getString(request, sb);

    if ( apiKey.length() > 0) {
        csv.write(sb);
    } else {
        sb.append(" : NOT LOGGED");
    }
    out.println("<pre> " + csv.getHeader() );
    out.print(sb);

%>
