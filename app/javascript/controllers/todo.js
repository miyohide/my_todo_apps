import axios from 'axios';

export default function showGantt() {
  console.log('show Gantto');
  todos();
}

function todos() {
  axios.get('/todos.json')
    .then(function (res) {
     console.log(res.data);
    })
    .catch(function (error) {
      console.log(error);
    });
}
