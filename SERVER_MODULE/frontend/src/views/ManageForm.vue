<template>
<navbar/>
   <main>

      <div class="hero py-5 bg-light">
         <div class="container">
            <a href="/createForm" class="btn btn-primary">
               Create Form
            </a>
         </div>
      </div>

      <div class="list-form py-5">
         <div class="container">
            <h6 class="mb-3">List Form</h6>

            <div class="form" v-for="item in data" :key="item">
               <router-link :to="'detailForm/' + item.slug" class="card card-default mb-3">
                  <div class="card-body">
                     <h5 class="mb-1">{{ item.name }}</h5>
                     <small class="text-muted">@{{ item.slug }} <span v-if="item.limit_one_response">(limit for 1 response)</span></small>
                  </div>
               </router-link>
            </div>

            <!-- <a href="detail-form.html" class="card card-default my-3">
               <div class="card-body">
                  <h5 class="mb-1">HTML Fundamental - Quiz</h5>
                  <small class="text-muted">@html-fundamental-quiz</small>
               </div>
            </a> -->

         </div>
      </div>
      
    </main>
</template>

<script>
import Navbar from '@/components/Navbar.vue'
import { ref } from '@vue/reactivity'
import localapi from '@/services/localapi'
import { onMounted } from '@vue/runtime-core'
export default {
    components: {
        Navbar
    },

    setup(){
        let data = ref('')

        const getData = async () => {
            const res = await localapi.index()
            if(res.status == 200){
               console.log(res.data.forms)
                data.value = res.data.forms
            }
        }

        onMounted(() => {
            getData()
        })

        return {
            data
        }
    }
}
</script>

<style>

</style>