import api from "./api";

export default{
    login(data){
        return api().post('auth/login', data)
    },

    logout(){
        return api().post('auth/logout', null, {
            headers: {
                'Authorization': 'Bearer ' + localStorage.getItem('token')
            }
        })
    },

    index(){
        return api().get('forms', {
            headers: {
                'Authorization': 'Bearer ' + localStorage.getItem('token')
            }
        })
    },

    createForm(data){
        return api().post('forms', data, {
            headers: {
                'Authorization': 'Bearer ' + localStorage.getItem('token')
            }
        })
    },

    detailForm(id){
        return api().get('forms/' + id, {
            headers: {
                'Authorization': 'Bearer ' + localStorage.getItem('token')
            }
        })
    },

    createQuestion(slug, data){
        return api().post('forms/' + slug + 'questions', data, {
            headers: {
                'Authorization': 'Bearer ' + localStorage.getItem('token')
            }
        })
    },

    deleteQuestion(slug, question_id){
        return api().delete('forms/' + slug + '/questions/' + question_id, null, {
            headers: {
                'Authorization': 'Bearer ' + localStorage.getItem('token')
            }
        })
    },

    createResponse(data, slug){
        return api().post('forms/' + slug + '/responses', data, {
            headers: {
                'Authorization': 'Bearer ' + localStorage.getItem('token')
            }
        })
    },

    getResponses(slug){
        return api().get('forms/' + slug + '/responses', {
            headers: {
                'Authorization': 'Bearer ' + localStorage.getItem('token')
            }
        })
    }
}