grid_card
=========

Alfred workflow for reading your grid card


To import into Alfred, [Download Alfred Workflow](https://github.com/kimdbarnes/grid_card/blob/master/Grid%20Card.alfredworkflow?raw=true) and open, Alfred should import it.

Open the ruby script step and change the grid_card_values list to your values - make sure to convert your grid card properly.

e.g.:
grid_card_values = 
[
['1', '2', '3'],
['a', 'b', 'c']
]

Run alfred and type "grid" with your challenge coordinates, e.g.: "grid a1 a2 a3"

Possible improvements:
* Open grid card from a file
* Handle format directly as Iain sends it 
* Code improvements?
