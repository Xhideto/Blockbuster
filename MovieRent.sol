// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract MovieRental {
    struct Movie {
        string title;
        bool isRented;
    }

    mapping(uint => Movie) public movies;
    uint public movieCount;

    // Add a new movie
    function addMovie(string memory title) public {
        movies[movieCount] = Movie(title, false);
        movieCount++;
    }

    // Rent a movie
    function rentMovie(uint movieId) public {
        require(movieId < movieCount, "The movie you want does not exist");
        require(!movies[movieId].isRented, "The movie you want is already rented");

        movies[movieId].isRented = true;
    }

    // Return a rented movie
    function returnMovie(uint movieId) public {
        require(movieId < movieCount, "The movie you want is already rented");
        require(movies[movieId].isRented, "The movie you want has not been rented yet");
        movies[movieId].isRented = false;
    }

    // Function to assert
    function assertMovie(uint movieId) public view {
        assert(movieId < movieCount); // This always be true if movie exists
    }

    // List all movies
    function listMovies() public view returns (Movie[] memory) {
        Movie[] memory movieList = new Movie[](movieCount);
            for (uint i = 0; i < movieCount; i++) {
                movieList[i] = movies[i];
            }
        return movieList;
    }
}
