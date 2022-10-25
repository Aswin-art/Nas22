<template>
  <navbar/>
 <main>
    <section class="login">
        <div class="container">
          <div class="row justify-content-center">
              <div class="col-lg-5 col-md-6">
                <h1 class="text-center mb-4">Formify</h1>
                <div class="card card-default">
                    <div class="card-body">
                      <h3 class="mb-3">Login</h3>
                      
                      <form action="manage-forms.html"> 
                          <!-- s: input -->
                          <div class="form-group my-3">
                            <label for="email" class="mb-1 text-muted">Email Address</label>
                            <input v-model="data.email" type="email" id="email" name="email" class="form-control" autofocus/>
                          </div> 

                          <!-- s: input -->
                          <div class="form-group my-3">
                            <label for="password" class="mb-1 text-muted">Password</label>
                            <input v-model="data.password" type="password" id="password" name="password" class="form-control"/>
                          </div>
                          
                          <div class="mt-4">
                            <button @click.prevent="login" type="submit" class="btn btn-primary">Login</button>
                          </div>
                      </form>

                    </div>
                </div> 
              </div>
          </div>
        </div>
    </section>
  </main>
</template>

<script>
// @ is an alias to /src
import localapi from '@/services/localapi'
import { ref } from '@vue/reactivity'
import { useRouter } from 'vue-router'
import Navbar from '@/components/Navbar.vue'

export default {
  name: 'HomeView',
  components: {
    Navbar
  },

  setup(){
    let data = ref({
      email: '',
      password: ''
    })

    const router = useRouter()

    const login = async () => {
      const res = await localapi.login(data.value)
      if(res.status == 200){
        console.log(res)
        alert('Login success')
        localStorage.setItem('isLogin', true)
        localStorage.setItem('token', res.data.user['accessToken'])
        router.push('/manageForm')
      }
    }

    return {
      data, login
    }
  }
}
</script>
