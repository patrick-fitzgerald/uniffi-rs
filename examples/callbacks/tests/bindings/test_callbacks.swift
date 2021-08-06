import callbacks;



class OnCallAnsweredImpl: OnCallAnswered {

    var yesCount: Int = 0
    var busyCount: Int = 0
    var stringReceived = ""

    func hello() -> String {
        yesCount += 1
        return "Hi hi $yesCount"
    }
    func busy(){
       busyCount += 1
    }
    func textReceived(text: String){
       stringReceived = text
    }

}

let telephone = Telephone()
let cbObject = OnCallAnsweredImpl()

telephone.call(true, cbObject)

assert(cbObject.busyCount == 0, "yesCount=${cbObject.busyCount} (should be 0)" )