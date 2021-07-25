<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<meta charset="utf-8">

<!-- Load d3.js -->
<script src="https://d3js.org/d3.v4.min.js"></script>

<!-- Load color scale -->
<script src="https://d3js.org/d3-scale-chromatic.v1.min.js"></script>


<!-- Create a div where the graph will take place -->
<div id="my_dataviz"></div>


<!-- A bit of CSS: change stroke color of circle on hover (white -> black) -->
<style>
.bubbles {
  stroke-width: 1px;
  stroke: black;
  opacity: .8
}
.bubbles:hover {
  stroke: black;
}
</style>


<script>

// set the dimensions and margins of the graph
var margin = {top: 50,right: 150, bottom: 20, left: 60},
    //width = 500 - margin.left - margin.right,
    //height = 420 - margin.top - margin.bottom;
    width = 800;
    height = 400;


// append the svg object to the body of the page
var svg = d3.select("#my_dataviz")
  .append("svg")
    .attr("width", width + margin.left + margin.right)
    .attr("height", height + margin.top + margin.bottom)
  .append("g")
    .attr("transform",
          "translate(" + margin.left + ","  + margin.top + ")")


//Read the data
d3.json("mydata.json" , function(data) {
/*var data = [{
        "Country"  :  "Korea", 
    		"Deathcase" : [1,2,2,6,8,11,12,13,16,17,21,28,32,35,42,43,48,50,53,60,60,66,67,72,75,75,81,84,91,94,102,104,111,120,126,131,139,144,152,158], 
    		"Totalcase" : [111,209,436,602,833,977,1261,1766,2337,3150,3736,4335,5186,5621,6284,6593,7041,7313,7478,7513,7755,7869,7979,8086,8162,8236,8320,8413,8565,8652,8799,8897,8961,9037,9137,9241,9332,9478,9583,9661],
        "Scale": 10
    } 
]*/




  // ---------------------------//
  //       AXIS  AND SCALE      //
  // ---------------------------//

  // Add X axis
  var x = d3.scaleLinear()
    .domain([0, 10000])
    .range([ 0, width ]);
  svg.append("g")
    .attr("transform", "translate(0," + height + ")")
    .call(d3.axisBottom(x).ticks(5))

  // Add X axis label:
  svg.append("text")
      //.attr("text-anchor", "start")
      .attr("text-anchor", "start")
      .attr("x", width)
      .attr("y", height+50 )
      .text("DeathCase")
      .attr("text-anchor", "end")
     

  // Add Y axis
  var y = d3.scaleLinear()
    .domain([0, 10000])
    .range([ height, 0]);
  svg.append("g")
    .call(d3.axisLeft(y).ticks(5))

  // Add Y axis label:
  svg.append("text")
      
      .attr("text-anchor", "end")
      .attr("x", 0)
      .attr("y", -20 )
      .text("Totalcase")
      .attr("text-anchor", "start")


  // Add a scale for bubble size
  var z = d3.scaleSqrt()
    .domain([30, 15000])
    .range([ 2, 30])

  // Add a scale for bubble color
 /* var myColor = d3.scaleOrdinal()
    .domain(["Asia", "Europe", "Americas", "Africa", "Oceania"])
    .range(d3.schemeSet1);*/
 
  //image add
  var defs = svg.append("defs")
    defs.append("pattern")
    .attr("id" , "myimage")
    .attr("height" ,"100%")
    .attr("width", "100%")
    .attr("patternContentUnits","objectBoundingBox")
    .append("image")
    .attr("height",1)
    .attr("width",1)
    .attr("preserveAspectRatio","none")
    .attr("xmlns:xlink","http://www.w3.org/1999/xlink")
    .attr("xlink:href","코로나 한국.png")

 
 function move() {
  d3.active(this)   
      .attr("cx", function(d,i,j) {  
         
          for(i = 0; i <= d.Country.length; i++) {
                
              for(j = 0; j <= d.Deathcase.length; j++) {
                  
                if(j >0)
                    return  width+1;
              }
              
          }
          return -1;
        
      })
      .attr("cy", function(d,i,j) {  
         
          for(i =0; i <= d.Country.length; i++) {
         
            for(j = 0; j <= d.Totalcase.length; j++) {
                
                if(j >0)
                    return  height/100;
              }
          }
          return -1;
      }) 
      
      .attr("r", function(d) {
          if(d.Totalcase > 0)
            return z(d.Scale)+10;
      }) 
    
    }



  // ---------------------------//
  //       CIRCLES              //
  // ---------------------------//

  // Add dots
  svg.append("g")
    .selectAll("dot")
    .data(data)
    .enter()
        .append("circle")
          .attr("class",function(d) { return "myimage"+  "bubbles "  + d.Country; })
          .attr("cx", function (d) { return x(d.Deathcase); } )
          .attr("cy", function (d) { return y(d.Totalcase); } )
          .attr("r", function (d) { return z(d.Scale); } )
          .attr("fill", "url(#myimage)")
        /*defs.selectAll(".dot-pattern")
        .data(data)
        .enter().append("pattern")
        .attr("class","dot-pattern")
        .attr("id" , "myimage")
        .attr("height" ,"10%")
        .attr("width", "10%")
        .attr("patternContentUnits","objectBoundingBox")
        .append("image")
        .attr("height",1)
        .attr("width",1)
        .attr("preserveAspectRatio","none")
        .attr("xmlns:xlink","http://www.w3.org/1999/xlink")
        .attr("xlink:href","코로나 한국.png")*/
     .transition()
     .duration(10000)
     .on("start",move)

  });
</script>
</html>