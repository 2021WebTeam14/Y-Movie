package actor;

public class actorDTO {
	private String mov_code;
	private String act_actor;
	public actorDTO(String mov_code, String act_actor) {
		super();
		this.mov_code = mov_code;
		this.act_actor = act_actor;
	}
	public String getMov_code() {
		return mov_code;
	}
	public String getAct_actor() {
		return act_actor;
	}	
}