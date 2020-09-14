import { LightningElement, api, wire, track } from "lwc";
import  getRelatedTrips from '@salesforce/apex/ConnectedTripsController.getRelatedTrips';
import { getRecord, getFieldValue } from 'lightning/uiRecordApi';
import ACCOUNT_FIELD from '@salesforce/schema/Case.AccountId';

export default class ConnectedTrips extends LightningElement {
    @api recordId;

    @track relatedTrips = [
        {
            Id: 'a002w00000B62aUAAR',
            Name: 'T#00004'
        },
        {
            Id: 'a002w00000B62VxAAJ',
            Name: 'T#00003'
        }];
    isLoading = false;


    get accountId() {
        if (this.caseObject) {
            return getFieldValue(this.caseObject.data, ACCOUNT_FIELD);
        }
        return null;
    }

    get hasResults() {
        return this.trips.length > 0;
    }

    get numberOfTrips() {
        return this.relatedTrips.length;
    }

    get trips() {
        return this.relatedTrips.map(item => {
            return {
                id: item.Id,
                label: item.Name
            };
        })
    }

    @wire(getRecord, { recordId: '$recordId', fields : [ACCOUNT_FIELD]})
    caseObject;

    // @wire(getRelatedTrips, {
    //     accountId : '$accountId'
    // })
    // wiredTrips({ error, data }) {
    //     if (data) {
    //         this.relatedTrips = data;
    //         this.isLoading = false;
    //     } else if (error) {
    //         console.error(error);
    //         this.isLoading = false;
    //     }
    // }
    // connectedCallback () {
    //     this.isLoading = true;
    //     // eslint-disable-next-line @lwc/lwc/no-async-operation
    //     setTimeout(() => {this.isLoading = false}, 2000);
    // }
}