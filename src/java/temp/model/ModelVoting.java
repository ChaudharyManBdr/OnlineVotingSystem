package temp.model;

public class ModelVoting {
    private String citizenNo;
    private String voterId;
    private String district;
    private int constituency;
    private String candidate;
    private String party;

    public String getCitizenNo() {
        return citizenNo;
    }

    public void setCitizenNo(String citizenNo) {
        this.citizenNo = citizenNo;
    }

    public String getVoterId() {
        return voterId;
    }

    public void setVoterId(String voterId) {
        this.voterId = voterId;
    }

    public String getDistrict() {
        return district;
    }

    public void setDistrict(String district) {
        this.district = district;
    }

    public int getConstituency() {
        return constituency;
    }

    public void setConstituency(int constituency) {
        this.constituency = constituency;
    }

    public String getCandidate() {
        return candidate;
    }

    public void setCandidate(String candidate) {
        this.candidate = candidate;
    }

    public String getParty() {
        return party;
    }

    public void setParty(String party) {
        this.party = party;
    }
    public boolean checkVoterList(){
           DB_Connect dbcon = new DB_Connect();
           try{
               String sql ="SELECT voter_id,citizen_no FROM voter_list WHERE voter_id=? AND citizen_no=?";
               dbcon.st = dbcon.con.prepareStatement(sql);
                dbcon.st.setString(1, getVoterId());
                dbcon.st.setString(2, getCitizenNo());
                dbcon.rs = dbcon.st.executeQuery();
            if (dbcon.rs.next()) {
                  return true;

            } else {
                 return false;

            }
               
           }catch(Exception e){
               return false;
           }               
    }
    public boolean checkDistrict(){
         DB_Connect dbcon = new DB_Connect();
           try{
               String sql ="SELECT district,constituency FROM registration WHERE citizen_no=?";
               dbcon.st = dbcon.con.prepareStatement(sql);
                dbcon.st.setString(1, getCitizenNo());
                dbcon.rs = dbcon.st.executeQuery();
            if (dbcon.rs.next()) {
                  return true;

            } else {
                 return false;

            }
               
           }catch(Exception e){
               return false;
           }  
        
    }
    
    public boolean castVote(){
        
        
        DB_Connect dbcon = new DB_Connect();
        
        try{
            
            String sql = "INSERT INTO voting (citizen_no,voter_id,district,constituency,candidate,party) values(?,?,?,?,?,?)";
            dbcon.st= dbcon.con.prepareStatement(sql);
            
            dbcon.st.setString(1,getCitizenNo());
            dbcon.st.setString(2,getVoterId());
            dbcon.st.setString(3,getDistrict());
            dbcon.st.setInt(4,getConstituency());
            dbcon.st.setString(5,getCandidate());
            dbcon.st.setString(6,getParty());
           // dbcon.st.setInt(7, '1');
            
            int ch =0;
            ch=dbcon.st.executeUpdate();
            if(ch==1){
                return true;
            }
            else{
                return false;
            }
            
        }catch(Exception ex){
            return false;
        }
       
    }
    
    
}
