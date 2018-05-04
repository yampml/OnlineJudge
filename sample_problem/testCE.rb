#include<bits/stdc++.h>

using namespace std;
typedef long long ll;

const int INF = 1e9;
const int MAX = 3*1e6+100;

struct Node
{
	int childL, childR;
	int MIN;
};
int a[MAX];


Node T[MAX];
int lazy[MAX];
int numNode;

int buildTree(int num, int start, int end)
{
//	cout << numNode << " " << start << end << endl;
	Node p;
	if(start == end)
	{
		p.childL = -1;
		p.childR = -1;
		p.MIN = a[start];
	}
	else
	{
		int mid = (start+end)/2;
		p.childL = ++numNode;
		int leftMin = buildTree(p.childL,start,mid);
		p.childR = ++numNode;
		int rightMin = buildTree(p.childR,mid+1, end);
		p.MIN = leftMin + rightMin;
	}
	T[num] = p;
	return p.MIN;
}

int queryRange(int num, int l, int r, int start, int end)
{
//	cout << start << end << " " << l << " " << r << endl;
	if(start > r || end < l) return 0;
	
	if(lazy[num] != 0)
	{
		T[num].MIN += (end - start + 1) * lazy[num];
		if(start != end)
		{
			lazy[T[num].childL] += lazy[num];
			lazy[T[num].childR] += lazy[num];
		}
		lazy[num] = 0;
	}

	if(l <= start && end <= r)
	{
		return T[num].MIN;
	}
	if(start != end)
	{
		int mid = (start + end)/2;
		return queryRange(T[num].childL, l, r, start, mid) + queryRange(T[num].childR, l, r, mid+1, end);	
	}
}

void updateRange(int num, int start, int end, int l, int r, int val)
{
//	cout << start << end << endl;
	if(lazy[num] != 0) 
	{
		T[num].MIN += (end - start +1) * lazy[num];
		if(start != end)
		{
			lazy[T[num].childL] += lazy[num];
			lazy[T[num].childR] += lazy[num];
		}
		lazy[num] = 0;
	}
	
	if(start > r || end < l) return;
	
	if(start >= l && r >= end)
	{
		T[num].MIN += (end - start + 1) * val;
		if(start != end)
		{
			lazy[T[num].childL] += val;
			lazy[T[num].childR] += val;
		}
		return;
	}
	if(start != end){
		int mid = (start + end)/2;
		updateRange(T[num].childL, start, mid, l, r, val);
		updateRange(T[num].childR, mid+1, end, l, r, val);
		T[num].MIN = T[T[num].childL].MIN + T[T[num].childR].MIN;
	}
}

int v[MAX];

int main() {
	ios::sync_with_stdio(false);
	numNode = 1;
	int N,M,Q;
	cin >> N >> M;
	buildTree(numNode, 1, N);
	for(int i=1; i<=M; i++) 
	{
		int l,r;
		cin >> l >> r;
		updateRange(1,1,N,l,r,1);
	}
	
	for(int i=0; i<N; i++)
	{
		v[i] = (queryRange(1,i+1,i+1,1,N));	
	}	
	sort(v,v+N);
//	for(int i=0; i<N; i++) cout << v[i] << " ";
//	cout << endl;
	cin >> Q;
	for(int i=1; i<=Q; i++)
	{
		int X;
		cin >> X;
		int l=0, r=M-1;
		int q = lower_bound(v,v+N,X) - v;
		cout << N-q;
//		if(X <= v[r])
//		{
//			while(l<r)
//			{
//				int mid = (l+r)/2;
//				if(v[mid] <= X) l = mid + 1;
//				else r = mid;
//			}
//			cout << M-1-l+1;
//		}
//		else cout << 0;
		cout << endl;
	}	
}

