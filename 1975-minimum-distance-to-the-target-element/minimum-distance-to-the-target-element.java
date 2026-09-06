class Solution {
    public int getMinDistance(int[] nums, int target, int start) {
        int min = Integer.MAX_VALUE;
        
        //Traverse from start → end
        for(int i=start;i<nums.length;i++)
        {
            if(nums[i] == target)
            {
                min = Math.min(min, Math.abs(start - i));
            }
        }

        //Traverse from start → beginning
        for(int i=start;i>=0;i--)
        {
            if(nums[i] == target)
            {
                min = Math.min(min, Math.abs(start - i));
            }
        }
        return min;
    }
}