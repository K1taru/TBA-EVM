// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

contract PublicNotedpad {
  
  struct Note {
    address author;
    string content;
    uint256 timestamp;
  }

  Note[] public notes;

  event NoteAdded(address indexed author, string content, uint256 timestamp);

  function addNote(string memory _content) public {
    notes.push(
      Note({
        author: msg.sender,
        content: _content,
        timestamp: block.timestamp
      })
    );
    require(bytes(_content).length > 0, "Note is empty");
    emit NoteAdded(msg.sender, _content, block.timestamp);
  }

  function getAllNotes() public view returns (Note[] memory) {
    return notes;
  }

}