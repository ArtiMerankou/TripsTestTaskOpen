import { LightningElement, api } from 'lwc';
import { NavigationMixin } from 'lightning/navigation';

export default class TripCard extends NavigationMixin(LightningElement) {
    @api trip;

    get label() {
        return this.trip.label;
    }

    navigateToRecordViewPage() {
        console.log(JSON.parse(JSON.stringify(this.trip)));
        this[NavigationMixin.Navigate]({
            type: 'standard__recordPage',
            attributes: {
                recordId: this.trip.id,
                actionName: 'view'
            }
        });
    }
}