var Car=function(model, noise)
{
  this.model=model;
  this.noise=noise;
  this.num_wheels=4;

  this.makeNoise=function()
  {
      console.log("Make Noise (Constructor Method): "+this.noise);
  }
}



var coche = new Car("Opel", "Burumm");
Car.prototype.Othernoise = function () {
  console.log("Other Noise (Protoype Method): "+this.noise);
};
coche.makeNoise();
coche.Othernoise()
coche.noise="Carrummm";
coche.Othernoise();
coche.makeNoise();
//console.log(coche.model);
