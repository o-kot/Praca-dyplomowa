class UserRequisitionViewModel
    attr_accessor :userRequisitionTargetCalories
    def initialize(id)
        @userID = id
    end
    def calculateUserRequisition(gender,height,weight,activity,age,target)  
        requisition = UserProfileInterface.new(ConfigDb::USERDATA.constantize.new,@userID)
        requisition.calculateUserRequisition
    end
    def getUserRequisition
        requisition = UserProfileInterface.new(ConfigDb::USERDATA.constantize.new,@userID).getUserRequisition
        if requisition.present? 
            userRequisitionPPM = requisition.PPM
            userRequisitionCPM = requisition.CPM
            userRequisitionTargetCalories = requisition.TargetCalories
            userRequisitionProtein = requisition.Protein
            userRequisitionCarbs = requisition.Carbs
            userRequisitionValine = requisition.Valine
            userRequisitionIsoleucine = requisition.Isoleucine
            userRequisitionLeucine = requisition.Leucine
            userRequisitionLysine = requisition.Lysine
            userRequisitionMethionine = requisition.Methionine
            userRequisitionThreonine = requisition.Threonine
            userRequisitionTryptophan = requisition.Tryptophan
            userRequisitionPhenylalanine = requisition.Phenylalanine
            userRequisitionVitA = requisition.VitA
            userRequisitionVitB1 = requisition.VitB1
            userRequisitionVitB2 = requisition.VitB2
            userRequisitionVitB3 = requisition.VitB3
            userRequisitionVitB4 = requisition.VitB4
            userRequisitionVitB5 = requisition.VitB5
            userRequisitionVitB6 = requisition.VitB6
            userRequisitionVitB9 = requisition.VitB9
            userRequisitionVitB12 = requisition.VitB12
            userRequisitionVitC = requisition.VitC
            userRequisitionVitD = requisition.VitD
            userRequisitionVitE = requisition.VitE
            userRequisitionVitH = requisition.VitH
            userRequisitionVitK = requisition.VitK
            userRequisitionCl = requisition.Cl
            userRequisitionZn = requisition.Zn
            userRequisitionF = requisition.F
            userRequisitionP = requisition.P
            userRequisitionI = requisition.I
            userRequisitionMg = requisition.Mg
            userRequisitionCu = requisition.Cu
            userRequisitionK = requisition.K
            userRequisitionSe = requisition.Se
            userRequisitionNa = requisition.Na
            userRequisitionCa = requisition.Ca
            userRequisitionFe = requisition.Fe
        end
    end
    def modifyUserRequisition
        requisition = UserProfileInterface.new(ConfigDb::USERDATA.constantize.new)
        requisition.modifyUserRequisition
    end
    def saveUserRequisition
        requisition = UserProfileInterface.new(ConfigDb::USERDATA.constantize.new)
        requisition.saveUserRequisition
    end
    private
    @userID = -1
    userRequisitionPPM = ''
    userRequisitionCPM = ''
    userRequisitionProtein = ''
    userRequisitionCarbs = ''
    userRequisitionValine = ''
    userRequisitionIsoleucine = ''
    userRequisitionLeucine = ''
    userRequisitionLysine = ''
    userRequisitionMethionine = ''
    userRequisitionThreonine = ''
    userRequisitionTryptophan = ''
    userRequisitionPhenylalanine = ''
    userRequisitionVitA = ''
    userRequisitionVitB1 = ''
    userRequisitionVitB2 = ''
    userRequisitionVitB3 = ''
    userRequisitionVitB4 = ''
    userRequisitionVitB5 = ''
    userRequisitionVitB6 = ''
    userRequisitionVitB9 = ''
    userRequisitionVitB12 = ''
    userRequisitionVitC = ''
    userRequisitionVitD = ''
    userRequisitionVitE = ''
    userRequisitionVitH = ''
    userRequisitionVitK = ''
    userRequisitionCl = ''
    userRequisitionZn = ''
    userRequisitionF = ''
    userRequisitionP = ''
    userRequisitionI = ''
    userRequisitionMg = ''
    userRequisitionCu = ''
    userRequisitionK = ''
    userRequisitionSe = ''
    userRequisitionNa = ''
    userRequisitionCa = ''
    userRequisitionFe = ''
end