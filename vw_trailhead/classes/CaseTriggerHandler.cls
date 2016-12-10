public class CaseTriggerHandler extends TriggerHandler {
    private List<Case> newCases;
    private List<Case> oldCases;
    private Map<Id, Case> newCaseMap;
    private Map<Id, Case> oldCaseMap;
    
    public CaseTriggerHandler() {
        this.newCases = (List<Case>) Trigger.new;
    }

    public override void beforeInsert() {
        Case thecase = this.newCases[0];
    }    
}