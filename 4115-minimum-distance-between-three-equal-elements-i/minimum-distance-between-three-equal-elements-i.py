class Solution:
    def minimumDistance(self, nums: List[int]) -> int:
        n = len(nums)
        last2 = [0] * n
        res = 200

        for i in range(n):
            val, pos = nums[i] - 1, i + 1
            pack = last2[val]
            old, cur = pack & 255, pack >> 8

            last2[val] = cur | (pos << 8)

            if old:
                res = min(res, (pos - old) << 1)

        return -(res == 200) | res