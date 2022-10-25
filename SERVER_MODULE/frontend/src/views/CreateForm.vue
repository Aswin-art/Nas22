<template>
<navbar/>
  <main>
      <div class="hero py-5 bg-light">
         <div class="container">
            <h2>Create Form</h2>
         </div>
      </div>

      <div class="py-5">
         <div class="container">
            <div class="row">
               <div class="col-md-6 col-lg-4">
                  
                  <form action="detail-form.html">
                     <!-- s: input -->
                     <div class="form-group mb-3">
                        <label for="name" class="mb-1 text-muted">Form Name</label>
                        <input type="text" id="name" name="name" class="form-control" autofocus v-model="data.name" />
                     </div>

                     <!-- s: input -->
                     <div class="form-group my-3">
                        <label for="slug" class="mb-1 text-muted">Form Slug</label>
                        <input type="text" id="slug" name="slug" class="form-control" v-model="data.slug" />
                     </div>

                     <!-- s: input -->
                     <div class="form-group my-3">
                        <label for="description" class="mb-1 text-muted">Description</label>
                        <textarea id="description" name="description" rows="4" class="form-control" v-model="data.description"></textarea>
                     </div>
                     
                     <!-- s: input -->
                     <div class="form-group my-3">
                        <label for="allowed-domains" class="mb-1 text-muted">Allowed Domains</label>
                        <input type="text" id="allowed-domains" name="allowed_domains" class="form-control" v-model="data.allowed_domains"/>
                        <div class="form-text">Separate domains using comma ",". Ignore for public access.</div>
                     </div>
                     
                     <!-- s: input -->
                     <div class="form-check form-switch" aria-colspan="my-3">
                        <input type="checkbox" id="limit_one_response" name="limit_one_response" class="form-check-input" role="switch" v-model="data.limit_one_response"/>
                        <label class="form-check-label" for="limit_one_response">Limit to 1 response</label>
                      </div>

                     <div class="mt-4">
                        <button @click.prevent="createForm" type="submit" class="btn btn-primary">Save</button>
                     </div>
                  </form>

               </div>
            </div>
         </div>
      </div>
    </main>
</template>

<script>
import Navbar from '@/components/Navbar.vue'
import { ref } from '@vue/reactivity'
import localapi from '@/services/localapi'
import { useRouter } from 'vue-router'
export default {
   components: {
      Navbar
   },

   setup(){
      let data = ref({
         name: '',
         slug: '',
         description: '',
         allowed_domains: [],
         limit_one_response: ''
      })

      let domains = ref('')

      const router = useRouter()

      const makeArray = () => {
         data.value.allowed_domains.push(domains.value.split(','))
      }

      const createForm = async () => {
         // makeArray()
         console.log(data.value)
         const res = await localapi.createForm(data.value)
         console.log(res)
         if(res.status == 200){
            alert('create success')
            router.push('/manageForm')
         }
      }

      return {
         data, createForm
      }
   }
}
</script>

<style>

</style>