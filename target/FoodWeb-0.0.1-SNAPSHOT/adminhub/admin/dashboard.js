const ctx = document.getElementById('saleChart');

  new Chart(ctx, {
    type: 'bar',
    data: {
      labels: ['Mon', 'Tue', 'Wed', 'Thus', 'Fri', 'Sat','Sun'],
      datasets: [{
        label: 'Sales',
        data: [4, 10, 6, 5, 7, 16,19],
        borderWidth: 1
      }]
    },
    options: {
      scales: {
        y: {
          beginAtZero: true
        }
      }
    }
  });


  const ct = document.getElementById('orderChart');

  new Chart(ct, {
    type: 'line',
    data: {
      labels: ['Mon', 'Tue', 'Wed', 'Thus', 'Fri', 'Sat','Sun'],
      datasets: [{
        label: 'Sales',
        data: [140, 100, 160, 150, 170, 160,250],
        borderWidth: 1
      }]
    },
    options: {
      scales: {
        y: {
          beginAtZero: true
        }
      }
    }
  });

  const mix = document.getElementById('salemom');
  new Chart(mix, {
    data: {
        datasets: [{
            type: 'line',
            label: 'Last Year',
            data: [50, 80, 70, 50, 90, 70, 30, 40, 120, 30, 40, 80, 60, 70]
        }, {
            type: 'line',
            label: 'This Year',
            data: [110, 60, 80, 70, 60, 100, 80, 50, 70, 120,100, 160, 250],
        }],
        labels: ['January', 'February', 'March', 'April','May','June','July', 'Auguts', 'Septemper', 'October','November','December']
    },
    options: {
      scales: {
        y: {
          beginAtZero: true
        }
      }
    }
});



