package review;

public class reviewDTO {
	private String mov_code;
	private String mem_id;
	private int rev_star;
	private int rev_thumbs; // 1 == up, 0 == down
	private String rev_context;
	private int rev_num;
	public reviewDTO(String mov_code, String mem_id, int rev_star, int rev_thumbs, String rev_context, int rev_num) {
		super();
		this.mov_code = mov_code;
		this.mem_id = mem_id;
		this.rev_star = rev_star;
		this.rev_thumbs = rev_thumbs;
		this.rev_context = rev_context;
		this.rev_num = rev_num;
	}
	public String getMov_code() {
		return mov_code;
	}
	public String getMem_id() {
		return mem_id;
	}
	public int getRev_star() {
		return rev_star;
	}
	public int getRev_thumbs() {
		return rev_thumbs;
	}
	public String getRev_context() {
		return rev_context;
	}
	public int getRev_num() {
		return rev_num;
	}
}