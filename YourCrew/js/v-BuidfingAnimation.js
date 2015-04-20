var1 = 0;
  $(function() {
            // create the image rotator
				$(".building").animate({ bottom: "-150" }, 2000, "swing",function(){
			//var1 = 1;
			//alert("call" + var1);
			});
			$(".building1").animate({ bottom: "-200" }, 2000, "swing",function(){
			//var1 = 1;
			//alert("call" + var1);
			});
			
		   setInterval("rotateImages()",3200);
		   setInterval("rotateImages1()",3200);
		   });
        
		function rotateImages() {
			if(var1==0)
			
			{	
			$(".building").animate({ left: "150" }, 3000, "swing",function(){
			var1 = 1;
			//alert("call" + var1);
			});
			}
			if(var1==1){
			//	alert("call" + var1);
				$(".building").animate({ left: "0" },3000, "swing",function(){
			var1 = 0;
			});
			}
	}
	


        
		function rotateImages1() {
			if(var1==0)
			
			{	
			$(".building1").animate({ right: "100" }, 3000, "swing",function(){
			var1 = 1;
			});
			}
			if(var1==1){

				$(".building1").animate({ right: "0" },3000, "swing",function(){
			var1 = 0;
			});
			}
	}
	// JavaScript Document
	
	
	    $(document).ready(function() {
				
				
                $('#far-clouds').pan({fps: 30, speed: 0.7, dir: 'left', depth: 30});
                $('#near-clouds').pan({fps: 30, speed: 1, dir: 'left', depth: 70});
                
                window.actions = {
                    speedyClouds: function(){
                        $('#far-clouds').spSpeed(20);
                        $('#near-clouds').spSpeed(20);
                    },
                    runningClouds: function(){
                        $('#far-clouds').spSpeed(8);
                        $('#near-clouds').spSpeed(12);
                    },
                    walkingClouds: function(){
                        $('#far-clouds').spSpeed(3);
                        $('#near-clouds').spSpeed(5);
                    },
                    lazyClouds: function(){
                        $('#far-clouds').spSpeed(0.7);
                        $('#near-clouds').spSpeed(1);
                    },
                    stop: function(){
                        $('#far-clouds, #near-clouds').spStop();
                    },
                    start: function(){
                        $('#far-clouds, #near-clouds').spStart();
                    },
                    toggle: function(){
                        $('#far-clouds, #near-clouds').spToggle();
                    },
                    left: function(){
                        $('#far-clouds, #near-clouds').spChangeDir('left');                    
                    },
                    right: function(){
                        $('#far-clouds, #near-clouds').spChangeDir('right');                    
                    }
                };
            });    