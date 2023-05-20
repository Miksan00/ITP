




<!DOCTYPE html>
<html lang="en">
<head>



    <meta charset="UTF-8">
    
    
    <style>
    .paragraph {
  background-color: #f5f5f5;
  padding: 20px;
  border-radius: 10px;
  box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.3);
  font-family: cursive;
}

.paragraph h2 {
font-family:monospace;
  font-size: 24px;
  margin-bottom: 10px;
  background-color: gold;
  color:white;
}

.paragraph p {
font-family:cursive;
  font-size: 16px;
  line-height: 1.5;
  color: #555;
}





    
        .card-container {
            display: flex;
            justify-content: space-around;
            align-items: center;
            flex-wrap: wrap;
            max-width: 800px;
            margin: 0 auto;
        }
        .card {
            width: 300px;
            margin: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .card-image {
            height: 250px;
            width: 100%;
            object-fit: cover;
        }
        .card-body {
            padding: 5px;
        }
        .card-title {
            font-size: 15px;
            margin: 10px 0;
        }
        .card-text {
            margin: 10px 0;
        }
        .card-link {
            display: inline-block;
            padding: 10px 20px;
            background-color: #007bff;
            color: #fff;
            text-decoration: none;
            border-radius: 15px;
        }
        .card-link:hover {
            background-color: #0069d9;
        }
    </style>
    
    
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">


    <!-- Font Icon -->
    <link rel="stylesheet" href="fonts/material-icon/css/material-design-iconic-font.min.css">

    <!-- Main css -->
    <link rel="stylesheet" href="Food/css/style.css"> 
</head>
<body style="background-image: url('home/images/addf.jpg'); font-size: 25px;">

    <div class="main">
		
        <div style="background-color:transparent;">
            <div class="booking-content"  >
              
                <div class="booking-form" style="background-color: #b9a99b; margin-left: 100px; ">

                    <form id="booking-form" action="insertuserres" method="post">
                        <h2 style="color: black;font-family: cursive;font-size:x-large; background-color: gold">Book  your Food!</h2>
     
           
                        <div class="form-group form-input" >
                            <input style="background-color: transparent; color:black;font-family: cursive;font-size: 15px;" value="${user}"  type="text" name="user" required/>
                            <label   class="form-label"style="background-color: transparent; color:black;font-family: cursive;">Username</label>
                        </div>
                       
                        <div style="background-color: transparent">
                            <div >
                                <select style="background-color: transparent; color:black;font-size: 20px" name="juice"  required>
                                    <option value="">Juice Items</option>
                                    <option value="Banana Juice">Banana Juice</option>
                                    <option value="Orange Juice">Orange Juice</option>
                                     <option value="PineApple Juice">PineApple Juice</option>
                                    <option value="Apple Juice">Apple Juice</option>
                                  
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="select-list">
                                <select style="background-color: transparent; color:black;font-size: 20px" name="main"  required>
                                    <option value="">Main Food</option>
                                    <option value="seasonalfish">Seasonal steamed fish</option>
                                    <option value="assortedmushrooms">Assorted mushrooms</option>
                                </select>
                            </div>
                        </div>
                        
                     <div class="form-group">
                            <div class="select-list">
                                <select style="background-color: transparent; color:black;font-size: 20px" name="dessert"  required>
                                    <option value="">Dessert</option>
                                    <option value="seasonalfish">Seasonal steamed fish</option>
                                    <option value="assortedmushrooms">Assorted mushrooms</option>
                                    <option value="Cuttlefish">Cuttlefish</option>
                                </select>
                            </div>
                        </div>
                        
                     
                        
                      



                        <div class="form-submit" >
                            <input style=" color:white; background-color: red" type="submit" value="Book now" class="submit"  />
                                                                             	
                       </div>
                    </form>
                    <div class="paragraph" style="margin-left: 60px">
  <h2 style="color: black">Importance of foods</h2>
<p>Food is one of the basic necessities of life. Food contains nutrients -substances essential for the growth, repair, and maintenance of body tissues and for the regulation of vital processes. Nutrients provide the energy our bodies need to function.</p>
</div>
                </div>
                
                
                
                
                
                
                
                
                <div class="booking-form" style="background-color: #b9a99b; ">
 			  			<button onclick="window.location.href='<%=request.getContextPath()%>/listuserres'" style="background-color:blue;color:white;padding:17px 35px; margin-left: 352px" class="btn-primary">My Bookings
						</button>
 					  <div class="card-container">

        <div class="card">
            <img class="card-image" src="home/images/drings.jpg" alt="Card Image 1">
            <div class="card-body">
                    
            </div>
        </div>
        <div class="card">
            <img class="card-image" src="home/images/food.jpg" alt="Card Image 2">
            <div class="card-body">
            </div>
        </div>
        <div class="card">
            <img class="card-image" src="home/images/card3.jpg" alt="Card Image 3">
            <div class="card-body">
                
                            </div>
        </div>
    </div>
                    
                </div>
                
                
                
                
            </div>
        </div>

    </div>

    <!-- JS -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="js/main.js"></script>
</body>
</html>