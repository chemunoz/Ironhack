var myRover = {
  position: [0,0],
  direction: 'N',
  line_counter: 0
};


function goForward(rover)
{
  colorGrid(rover, false);
  switch(rover.direction) {
    case 'N':
      rover.position[0]--
      break;
    case 'E':
      rover.position[1]++
      break;
    case 'S':
      rover.position[0]++
      break;
    case 'W':
      rover.position[1]--
      break;
    }
    roverPosition(rover);
  };

function goBack(rover)
{
  colorGrid(rover, false);
  switch(rover.direction) {
    case 'N':
      rover.position[0]++
      break;
    case 'E':
      rover.position[1]--
      break;
    case 'S':
      rover.position[0]--
      break;
    case 'W':
      rover.position[1]++
      break;
    }
    roverPosition(rover);
  };

function turnRight(rover)
{
  switch(rover.direction) {
    case 'N':
      rover.direction='E';
      document.getElementById('direction_img').src="./imags/current_right.png";
      break;
    case 'E':
      rover.direction='S';
      document.getElementById('direction_img').src="./imags/current_down.png";
      break;
    case 'S':
      rover.direction='W';
      document.getElementById('direction_img').src="./imags/current_left.png";
      break;
    case 'W':
      rover.direction='N';
      document.getElementById('direction_img').src="./imags/current_up.png";
      break;
    }
    roverPosition(rover);
};

function turnLeft(rover)
{
  switch(rover.direction) {
    case 'N':
      rover.direction='W';
      document.getElementById('direction_img').src="./imags/current_left.png";
      break;
    case 'E':
      rover.direction='N';
      document.getElementById('direction_img').src="./imags/current_up.png";
      break;
    case 'S':
      rover.direction='E';
      document.getElementById('direction_img').src="./imags/current_right.png";
      break;
    case 'W':
      rover.direction='S';
      document.getElementById('direction_img').src="./imags/current_down.png";
      break;
    }
    roverPosition(rover);
};


function roverPosition(rover){
  //Grid Limit Control (N-S Direction)
  if (rover.position[0]>9) { rover.position[0]=0; }
  if (rover.position[0]<0) { rover.position[0]=9; }

  //Grid Limit Control (E-W Direction)
  if (rover.position[1]>9) { rover.position[1]=0; }
  if (rover.position[1]<0) { rover.position[1]=9; }

  rover.line_counter+=1;
  if (rover.line_counter>=15)
  {
    document.getElementById('board').innerHTML="New Rover Position: [" + rover.position[0] + ", " + rover.position[1] + "] and Direction: " + rover.direction+"<br>";
    rover.line_counter=0;
  }
  else
  {
    document.getElementById('board').innerHTML+="New Rover Position: [" + rover.position[0] + ", " + rover.position[1] + "] and Direction: " + rover.direction+"<br>";
  }
  console.log("New Rover Position: [" + rover.position[0] + ", " + rover.position[1] + "] and Direction: " + rover.direction);
  colorGrid(rover, true);

}

function sendOrders(rover)
{
  var x;
  var orders_array=[];
  var orders = document.getElementById('sequence').value;

  for (var i = 0; i < orders.length; i++)
  {
    orders_array.push(orders.charAt(i));
  }

  for (x in orders_array)
  {
    switch (orders_array[x].toLowerCase())
    {
      case 'f':
        goForward(rover);
        break;
      case 'b':
        goBack(rover);
        break;
      case 'r':
        turnRight(rover);
        break;
      case 'l':
        turnLeft(rover);
        break;
    }
  }
}

function colorGrid (rover, colortype)
{
  var row=1;
  var col=1;

  //if (rover.position[0]!=10)
  //{
    row=parseInt(rover.position[0])+1;
  //}
  //if  (rover.position[1]!=10)
  //{
    col=parseInt(rover.position[1])+1;
  //}
  //alert('f'+row+'c'+col);

  if (colortype===true)
  {
    document.getElementById('f'+row+'c'+col).style.background='#F00';
  }
  else
  {
    document.getElementById('f'+row+'c'+col).style.background='#0F0';
  }


}
//goForward(myRover);
