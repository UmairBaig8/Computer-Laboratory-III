<%-- 
    Document   : booth.jsp
    Created on : Apr 20, 2016, 12:34:01 AM
    Author     : sony-vaio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    
        <h1>Hello World!</h1>
        
        <%! int a; int b; int size;%>
        
        
        <% 
            a = Integer.parseInt(request.getParameter("m"));
            b = Integer.parseInt(request.getParameter("r"));
            size = a%b;

            
            String s = Integer.toBinaryString(a);
            String s1 = Integer.toBinaryString(b);
            
            int m[] = to_binary(s);
            int m1[] =  t_compliment(to_binary(s));
            int r[] = to_binary(s1);
            int q[] = new int[size];
            
            %><h3> M : <%
            for(int j=0;j<size;j++){
                out.print(m[j]);
            }
            %>  | M' : <%
            for(int j=0;j<size;j++){
                out.print(m1[j]);
            }

            %>  | R : <%
            for(int j=0;j<size;j++){
                out.print(r[j]);
            }
            int bb=0;
            %>  | bit : <%= bb%> </h3>
            
            <table border="1">
                <th>
                    <td> M </td><td> Q </td><td> R </td><td> Bit </td><td> Action </td>
                </th>
            <%                
            for(int k=0;k<size;k++){
                out.print("<tr>");
                
                out.print("<td>Step "+k+"</td><td>");
                for(int i=0;i<size;i++){
                    out.print(m[i]);
                }
                out.print("</td><td>");
                for(int i=0;i<size;i++){
                    out.print(q[i]);
                }
                out.print("</td><td>");
                for(int i=0;i<size;i++){
                    out.print(r[i]);
                }
                out.print("</td><td>"+bb+"</td>");

                if(r[size-1]==1 && bb==0){
                    bin_add(q, m1);
                    out.print("<td>Substraction</td>");
                }
                else if(r[size-1]==0 && bb==1){
                    bin_add(q, m);
                    out.print("<td>Addition</td>");
                }
                else{
                    out.print("<td></td>");
                }
                bb = r[size-1];
                int t = q[size-1];
                for(int j = size - 1; j > 0; j--) {
                    q[j] = q[j - 1];
                }
                for (int j = size - 1; j > 0; j--) {
                    r[j] = r[j - 1];
                }
                r[0] = t;
                
                out.print("</tr><tr>");
                
                out.print("<td>Step "+k+"</td><td>");
                for(int i=0;i<size;i++){
                    out.print(m[i]);
                }
                out.print("</td><td>");
                for(int i=0;i<size;i++){
                    out.print(q[i]);
                }
                out.print("</td><td>");
                for(int i=0;i<size;i++){
                    out.print(r[i]);
                }
                out.print("</td><td>"+bb+"</td>");
                out.print("<td>Shifting</td></tr>");
            }
            out.print("</table>");
            out.print("<br>Final :");
            for(int i=0;i<size;i++){
                out.print(q[i]);
            }
            out.print(" ");
            for(int i=0;i<size;i++){
                out.print(r[i]);
            }
            out.print(" "+bb);
            
            out.print("<h4> Final in decimal : "+to_decimal(q, r)+"</h4>");


        %>
        
        <%!  
            public int[] to_binary(String st) {
                    while(st.length()<size){
                        st = "0"+st;
                    }
                    int arr[] = new int[size];
                    for (int i =0 ; i < st.length(); i++) {
                        arr[i] = Integer.parseInt(String.valueOf(st.charAt(i)));
                    }
                    return arr;
                }
                public int to_decimal(int a[],int b[]){
                    int ans=0;
                    int t[] = new int[size*2];
                    int z = 0;
                    for (int i = 0; i < size; i++) 
                        t[z++] = a[i];
                    for (int i = 0; i < size; i++) 
                        t[z++] = b[i];

                    int c=0;
                    for(int i=(size*2)-1;i>=0;i--)
                        ans += Math.pow(2, c++) * t[i];
                    return ans;
                }

                public void bin_add(int a[], int b[]) {
                    int[] c = new int[size];
                    int cr = 0;
                    for (int i = size - 1; i >= 0; i--) {
                        c[i] = (a[i] + b[i] + cr) % 2;
                        cr = (a[i] + b[i] + cr) / 2;
                        a[i] = c[i];
                    }
                }

                public void o_complimet(int arr[]){
                    for (int i = 0;i<size; i++) {
                        arr[i] = arr[i]==1 ? 0:1;
                    }
                }

                public int[] t_compliment(int arr[]) {
                    int cf = 1;
                    int a[] = arr;
                    o_complimet(a);
                    for (int i = size - 1; i > 0; i--) {
                        if (a[i] == 1 && cf == 1) {
                            cf = 1;
                            a[i] = 0;
                        } else if (cf == 1) {
                            cf = 0;
                            a[i] = 1;
                            break;
                        }
                    }
                    return a;
                }
        %>

    
</html>
