package hello.domain;

public class PageMaker{
    private int totalcount;     //전체게시물개수
    private int pagenum;        //현재페이지 번호
    private int contentnum=10;     //한 페이지에 몇개 표시할지
    private int startPage=1;      //현재 페이지 블록의 시작 페이지
    private int endPage=5;        //현재 페이지 블록의 마지막 페이지
    private boolean prev=false;       //이전 페이지로 가는 화살표
    private boolean next;       //다음 페이지로 가는 화살표
    private int currentblock;   //현재 페이지 블록
    private int lastblock;      //마지막 페이지 블록
    
    /**
     * 페이지 블록의 양 끝 화살표를 출력할지 안할지 결정하는 메소드
     * @param pagenum
     */
    public void prevnext(int pagenum) {
        if(pagenum>0 && pagenum<6) {		//첫번째페이지 블록이면 <<화살표가 없어야함
            setPrev(false);
            setNext(true);
        }else if(getLastblock() == getCurrentblock()) {		//마지막 페이지 블록이면 >>화살표가 없어야함
            setPrev(true);
            setNext(false );
        }else {
            setPrev(true);
            setNext(true);
        }
    }

    /**
     * 총 페이지 수를 찾는 함수
     */
    public int calcpage(int totalcount, int contentnum){
        int totalpage = totalcount / contentnum;
        if(totalcount % contentnum > 0){
            totalpage++;
        }
        return totalpage;
    }
     
    public int getTotalcount() {
        return totalcount;
    }
    public void setTotalcount(int totalcount) {
        this.totalcount = totalcount;
    }
    public int getPagenum() {
        return pagenum;
    }
    public void setPagenum(int pagenum) {
        this.pagenum = pagenum;
    }
    public int getContentnum() {
        return contentnum;
    }
    public void setContentnum(int contentnum) {
        this.contentnum = contentnum;
    }
    public int getStartPage() {
        return startPage;
    }
    public void setStartPage(int currentblock) {
        this.startPage = (currentblock*5)-4;
    }
    public int getEndPage() {
        return endPage;
    }
    public void setEndPage(int getlastblock, int getcurrentblock) {
        if(getlastblock == getcurrentblock) {		//마지막 블록일때
            this.endPage = calcpage(getTotalcount(), getContentnum());	
        }else {		
            this.endPage = getStartPage()+4;
        }        
    }
    public boolean isPrev() {
        return prev;
    }
    public void setPrev(boolean prev) {
        this.prev = prev;
    }
    public boolean isNext() {
        return next;
    }
    public void setNext(boolean next) {
        this.next = next;
    }
    public int getCurrentblock() {
        return currentblock;
    }
    public void setCurrentblock(int pagenum) {
        this.currentblock = pagenum/5;
        if(pagenum%5>0) {
            this.currentblock++; 
        }
    }
    public int getLastblock() {
        return lastblock;
    }
    public void setLastblock(int totalcount) {
        this.lastblock = totalcount / (5*this.contentnum);
        if(totalcount%(5*this.contentnum)>0) {
            this.lastblock++;   
        }
    }
}