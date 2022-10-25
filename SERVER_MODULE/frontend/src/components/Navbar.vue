<template>
  <nav class="navbar navbar-expand-lg sticky-top bg-primary navbar-dark">
    <div class="container">
    <a class="navbar-brand" href="manage-forms.html">Formify</a>
    <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
        <li class="nav-item">
        <a class="nav-link active" href="/manageForm">Administrator</a>
        </li> 
        <li class="nav-item" v-if="!isLogin">
        <button @click="logout" class="btn bg-white text-primary ms-4">Logout</button>
        </li>
    </ul> 
    </div>
</nav>
</template>

<script>
import localapi from '@/services/localapi'
import {useRouter} from 'vue-router'
export default {
    setup(){
        const router = useRouter()
        const logout = async () => {
            const res = await localapi.logout()
            if(res.status == 200){
                router.push('/')
            }
        }

        let isLogin = false

        return {
            logout, isLogin
        }
    }
}
</script>

<style>

</style>