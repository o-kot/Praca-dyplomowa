class UserRequisitionViewModel
    def calculateUserRequisition(gender,height,weight,activity,age,target)  
        requisition = UserProfileInterface.new(ConfigDb::USERDATA.constantize.new)
        requisition.calculateUserRequisition()      
    end
    def getUserRequisition
        requisition = UserProfileInterface.new(ConfigDb::USERDATA.constantize.new)
        requisition.getUserRequisition()
    end
    def modifyUserRequisition
        requisition = UserProfileInterface.new(ConfigDb::USERDATA.constantize.new)
        requisition.modifyUserRequisition()
    end
    def saveUserRequisition
        requisition = UserProfileInterface.new(ConfigDb::USERDATA.constantize.new)
        requisition.saveUserRequisition()
    end
    $userRequisitionTargetCalories = ''
    private
    @userRequisitionID = ''
    @userRequisitionUserID = ''
    @userRequisitionPPM = ''
    @userRequisitionCPM = ''
    @userRequisitionProtein = ''
    @userRequisitionCarbs = ''
    @userRequisitionValine = ''
    @userRequisitionIsoleucine = ''
    @userRequisitionLeucine = ''
    @userRequisitionLysine = ''
    @userRequisitionMethionine = ''
    @userRequisitionThreonine = ''
    @userRequisitionTryptophan = ''
    @userRequisitionPhenylalanine = ''
    @userRequisitionVitA = ''
    @userRequisitionVitB1 = ''
    @userRequisitionVitB2 = ''
    @userRequisitionVitB3 = ''
    @userRequisitionVitB4 = ''
    @userRequisitionVitB5 = ''
    @userRequisitionVitB6 = ''
    @userRequisitionVitB9 = ''
    @userRequisitionVitB12 = ''
    @userRequisitionVitC = ''
    @userRequisitionVitD = ''
    @userRequisitionVitE = ''
    @userRequisitionVitH = ''
    @userRequisitionVitK = ''
    @userRequisitionCl = ''
    @userRequisitionZn = ''
    @userRequisitionF = ''
    @userRequisitionP = ''
    @userRequisitionI = ''
    @userRequisitionMg = ''
    @userRequisitionCu = ''
    @userRequisitionK = ''
    @userRequisitionSe = ''
    @userRequisitionNa = ''
    @userRequisitionCa = ''
    @userRequisitionFe = ''
end