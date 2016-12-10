public class NewCaseListController {

    public NewCaseListController () {
    }
    
    public List<Case> getNewCases() {
        return [select Id, CaseNumber from Case where status='New'];    
    }
}