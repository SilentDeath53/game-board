% Initialize the game board
board = zeros(3, 3); % 3x3 game board

% Variable to keep track of the current player
current_player = 1;

% Game loop
while true
    % Display the current state of the game board
    disp(board);
    
    % Get the user input for the row and column of the move
    row = input('Enter the row (1-3): ');
    column = input('Enter the column (1-3): ');
    
    % Check if the move is valid
    if board(row, column) == 0
        % Update the game board with the current player's move
        board(row, column) = current_player;
        
        % Switch to the other player
        if current_player == 1
            current_player = 2;
        else
            current_player = 1;
        end
    else
        disp('Invalid move. Try again.');
    end
    
    % Check for a winning condition or a draw
    if check_win(board, 1)
        disp('Player 1 wins!');
        break;
    elseif check_win(board, 2)
        disp('Player 2 wins!');
        break;
    elseif all(board(:) ~= 0)
        disp('It\'s a draw!');
        break;
    end
end

% Function to check for a winning condition
function is_win = check_win(board, player)
    % Check rows
    is_win = any(all(board == player, 2));
    
    % Check columns
    is_win = is_win || any(all(board == player, 1));
    
    % Check diagonals
    is_win = is_win || all(diag(board) == player) || all(diag(fliplr(board)) == player);
end
