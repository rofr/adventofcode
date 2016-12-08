package adventofcode.day1;

import java.util.HashSet;

public class Grid {

	/*
	 * The direction we are facing. 
	 * 0,1,2,3 -> North, East, South, West
	 */
	int facing = 0; 
	
	/*
	 * our current position
	 */
	private int x, y;
	
	/*
	 * Positions that we have visited
	 */
	final HashSet<String> visited = new HashSet<>();

	/*
	 * how moving 1 step forward affects our current position
	 */
	int[][] movements = {{1,0},{0,1},{-1,0},{0,-1}};
	
	/*
	 * True if we have been at any given location at least twice
	 */
	boolean someLocationRevisited = false;

	/**
	 * Turn a given direction and proceed forward 
	 * a given number of steps
	 */
	public void move(Turn turn, int steps) {
		if (turn == Turn.Left) facing = (facing + 3) % 4;
		else facing = (facing + 1) % 4;
		
		for(int i=0;i < steps; i++) {
			x += movements[facing][0];
			y += movements[facing][1];
			trackLocation();
		}
	}
	/*
	 * Keep track of the current position and check 
	 * if we have been here before. 
	 */
	private void trackLocation() {
		String location = x + "," + y;
		if (visited.contains(location) && ! someLocationRevisited) {
			System.out.println("First revisited location, distance: " 
					+ distanceToOrigo());
			someLocationRevisited = true;
		}
		visited.add(location);
	}
	
	/**
	 * Move according to a single string
	 * instruction in the form ^[LR]\d+$
	 */
	public void move(String instruction) {
		Turn turn = instruction.charAt(0) == 'L' ? Turn.Left : Turn.Right;
		int steps = Integer.parseInt(instruction.substring(1));
		move(turn, steps);
	}
	
	public int distanceToOrigo() {
		return Math.abs(x) + Math.abs(y);
	}
	
	public static void main(String[] args) {
		String[] instructions = input.split(", *");
		Grid d = new Grid();
		for(String instruction : instructions) d.move(instruction);
		System.out.println("Final location, distance : " + d.distanceToOrigo());
	}
	
	/*
	 * My unique puzzle input
	 */
	private static String input = "L4, L1, R4, R1, R1, L3, R5, L5, L2, L3, R2, R1, L4, R5, R4, L2, R1, R3, L5, R1, L3, L2, R5, L4, L5, R1, R2, L1, R5, L3, R2, R2, L1, R5, R2, L1, L1, R2, L1, R1, L2, L2, R4, R3, R2, L3, L188, L3, R2, R54, R1, R1, L2, L4, L3, L2, R3, L1, L1, R3, R5, L1, R5, L1, L1, R2, R4, R4, L5, L4, L1, R2, R4, R5, L2, L3, R5, L5, R1, R5, L2, R4, L2, L1, R4, R3, R4, L4, R3, L4, R78, R2, L3, R188, R2, R3, L2, R2, R3, R1, R5, R1, L1, L1, R4, R2, R1, R5, L1, R4, L4, R2, R5, L2, L5, R4, L3, L2, R1, R1, L5, L4, R1, L5, L1, L5, L1, L4, L3, L5, R4, R5, R2, L5, R5, R5, R4, R2, L1, L2, R3, R5, R5, R5, L2, L1, R4, R3, R1, L4, L2, L3, R2, L3, L5, L2, L2, L1, L2, R5, L2, L2, L3, L1, R1, L4, R2, L4, R3, R5, R3, R4, R1, R5, L3, L5, L5, L3, L2, L1, R3, L4, R3, R2, L1, R3, R1, L2, R4, L3, L3, L3, L1, L2";
}