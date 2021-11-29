package movie;

public class CodeNameYearDTO {
    private String Code;
    private String Name;
    private String Year;

	public CodeNameYearDTO() {
    }

	public CodeNameYearDTO(String code, String name, String year) {
		super();
		Code = code;
		Name = name;
		Year = year;
	}
	
    public String getCode() {
		return Code;
	}

	public String getName() {
		return Name;
	}

	public String getYear() {
		return Year;
	}
}