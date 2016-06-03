public with sharing class AppController {
    public NgSfAppController() {
        //...
    }

    @RemoteAction
    public static List<User> GetAllUsersByFilter(String searchText) {
        System.debug('::::: GetAllUsersByFilter :::::');
        System.debug('Search text: ' + searchText);

        String searchString = '%' + searchText + '%';
        List<User> userList = [
            SELECT Id, Name, FullPhotoUrl, Profile.Name, Title
            FROM User
            WHERE Name LIKE :searchString
        ];

        return userList;
    }

    @RemoteAction
    public static List<User> GetTeam() {
        System.debug('::::: GetTeam!!! :::::');
        List<User> team = [
            Select Id, Name, FullPhotoUrl, Title, Manager.Name, Department 
            FROM User WHERE Department = 'IS Dev Services'
        ];

        return team;
    }

    @RemoteAction
    public static User GetCurrentUser() {
        return [SELECT Id, Name, Title, FullPhotoUrl, SmallPhotoUrl FROM User WHERE id = :UserInfo.getUSerID()];
    }

}