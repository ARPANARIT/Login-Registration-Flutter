<html>
    <body>
        <h1>
            </h1>
            <b>
               <style color="red"></style> 
               REGISTRATION FORM
                </b>
                
        <br><br><br><br>
        <form action="http://localhost:8000/api/register" method="post">
            @csrf
            <input type="text" placeholder="Name" name="rname"><br><br>
            <input type="text" placeholder="Email" name="remail"><br><br>
            <button>Submit</button>
        </form>
    </body>
</html>