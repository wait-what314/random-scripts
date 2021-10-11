var ilist = document.images;

ilist.forEach(change);

document.body.style.backgroundImage = "url('https://c.tenor.com/u9XnPveDa9AAAAAM/rick-rickroll.gif')"

function change(value) {
  value.src = "https://c.tenor.com/u9XnPveDa9AAAAAM/rick-rickroll.gif"
  var audio = new Audio('https://www.soundboard.com/mediafiles/mz/Mzg1ODMxNTIzMzg1ODM3_JzthsfvUY24.MP3');
  audio.play();
}