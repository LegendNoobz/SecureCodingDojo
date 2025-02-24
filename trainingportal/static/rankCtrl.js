app.controller('rankCtrl', function ($scope, $http) {
    $scope.scoreList = []; // Pastikan daftar skor ada
    $scope.errorMessage = ""; // Simpan pesan error

    // Fungsi mengambil data skor dari server
    $scope.fetchUserScores = function () {
        $http.get('/api/users/scores', window.getAjaxOpts())
            .then(function (response) {
                if (response.data) {
                    $scope.scoreList = response.data; // Simpan data ke scoreList
                    console.log("User Scores:", $scope.scoreList);
                }
            })
            .catch(function (error) {
                console.error("Error fetching user scores:", error.data);
            });
    };

    // Ambil data saat halaman dimuat
    $scope.fetchUserScores();
});
