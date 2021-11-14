package actor;

public class actorDTO {
	private String mov_name;
	private String act_actor;
	public actorDTO(String mov_name, String act_actor) {
		super();
		this.mov_name = mov_name;
		this.act_actor = act_actor;
	}
	public String getMov_name() {
		return mov_name;
	}
	public String getAct_actor() {
		return act_actor;
	}	
}