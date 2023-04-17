import axios from "axios";

const http = axios.create({
    baseURL: 'http://localhost:9000'
})

export default {
    getAllUsers() {
        return http.get(`/user`)
    },
    getUserId(username) {
        return http.get(`user/id/name=${username}`)
    },
    updateUserRole(id, role) {
        return http.put(`/user/${id}`, role)
    }
}