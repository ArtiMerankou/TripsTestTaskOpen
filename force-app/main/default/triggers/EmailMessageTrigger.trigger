trigger EmailMessageTrigger on EmailMessage (before insert, before update, before delete, after insert, after update, after delete, after undelete) {

    try {

        EmailMessageTriggerHandler handler = new EmailMessageTriggerHandler();

        // BEFORE INSERT
        if (Trigger.isInsert && Trigger.isBefore) {
            handler.OnBeforeInsert(Trigger.new);
        }
        // AFTER INSERT
        else if (Trigger.isInsert && Trigger.isAfter) {
            handler.OnAfterInsert(Trigger.new, Trigger.newMap);
        }
        // BEFORE UPDATE
        else if (Trigger.isUpdate && Trigger.isBefore) {
            handler.OnBeforeUpdate(Trigger.old, Trigger.new, Trigger.newMap, Trigger.oldMap);
        }
        // AFTER UPDATE
        else if (Trigger.isUpdate && Trigger.isAfter) {
            handler.OnAfterUpdate(Trigger.old, Trigger.new, Trigger.newMap, Trigger.oldMap);
        }
        // BEFORE DELETE
        else if (Trigger.isDelete && Trigger.isBefore) {
            handler.OnBeforeDelete(Trigger.old, Trigger.oldMap);
        }
        // AFTER DELETE
        else if (Trigger.isDelete && Trigger.isAfter) {
            handler.OnAfterDelete(Trigger.old, Trigger.oldMap);
        }
        // (AFTER) UNDELETEE
        else if (Trigger.isUndelete && Trigger.isAfter) {
            handler.OnUndelete(Trigger.new);
        }

    } catch (Exception ex) {
        System.debug('>>> EmailMessageTrigger Exception: ' + ex);
    }
}