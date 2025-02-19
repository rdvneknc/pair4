import React, { useEffect, useState } from 'react'
import { Link } from 'react-router-dom'
import ContentCard from '../../components/ContentCard/ContentCard'
import ProductCard from '../../components/ProductCard/ProductCard'
import { ProductModel } from '../../models/responses/ProductModel'
import ProductService from '../../services/ProductService'
import SwiperCard from '../../components/SwiperCard/SwiperCard'
import authService from '../../services/authService'
type Props = {}

const Homepage = (props: Props) => {
  const [products, setProducts] = useState<ProductModel[]>([])
  const [isButton, setIsButton] = useState(false);

  useEffect(() => {
    fetchProducts();
  }, [])

  const fetchProducts = () => {
    console.log("İstek homepage'den atılıyor.")
    ProductService.getAll().then((response: any) => {
      console.log("Cevap homepage'e ulaştı");
      setProducts(response.data)
    })
  }
  console.log(isButton);


  return (
    <>
      {/* Hero Section */}
      <section className='h-64 md:h-96 lg:h-140 group relative scroll-smooth'>
        {/* Hero Image */}
        <img src='/images/view1.jpg' alt='main image' className='h-full w-full object-cover' />
        {/* Hero Content */}
        <div className='absolute bottom-0 w-full bg-gradient-to-b from-transparent to-cyan-800'>
          {/* Hero Content Container */}
          <div className='container font-comfortaa'>
            <h3 className='text-emerald-100 tracking-widest group-hover:mb-1 duration-500'>
              Reliable, Efficient, Economical, Service
            </h3>
            <h1 className='text-4xl lg:text-6xl text-rentWhite group-hover:mb-1 duration-500'>
              Rees Rental 
            </h1>
            <p className='text-rentWhite group-hover:mb-1 duration-500 text-sm lg:text-base w-3/4 lg:w-2/3'>Discover the perfect blend of speed, ease, and affordability with our car rental service. Enjoy lightning-quick bookings, straightforward processes, and economic options for your effortless journey. Your adventure begins here!</p>
            {/* Detail Container */}
            <div className='flex float-right space-x-8 opacity-0 group-hover:opacity-100 group-hover:mb-5 lg:group-hover:mb-14 duration-1000'>
              <Link to={"/cars"} className='text-rentWhite text-sm lg:text-base bg-rentYellow rounded-full p-2 hover:p-4 lg:hover:p-5 lg:hover:text-xl transtion duration-1000'>Rent Now <i className="fa-solid fa-key pl-1"></i></Link>
            </div>
          </div>
        </div>
      </section>
      {/* Highlights Section */}
      <section>
        <ContentCard />
      </section>
      {/* Sample Text */}
      <section>
        <div className='container font-comfortaa text-center'>
          <p className='text-lg'>every journey becomes an adventure</p>
          <p className='tracking-wide font-black text-[35px] text-cyan-800'>Discover the ease of mobility with <span className='text-5xl text-transparent tracking-tight bg-gradient-to-tl bg-clip-text from-cyan-800 from-10% via-gray-300 via-45%  to-cyan-800 to-100%'>REES</span></p>
        </div>
      </section>
      {/* Sample Car Section */}
      <section>
        <div className={`container flex flex-row flex-wrap justify-center gap-x-8 gap-y-[84px] py-24 ${!isButton ? 'h-[762px]' : 'h-full'} overflow-hidden`}>
          {
            products.map(product => (
              <div key={product.id}>
                <ProductCard product={product} />
              </div>
            ))
          }
        </div>
        <div className={`container flex justify-center font-comfortaa text-[18px] h-12 w-48 mb-12 mt-4 ${!isButton ? 'block' : 'hidden'}`}>
          <button onClick={() => {setIsButton(true)}} className='bg-cyan-800 px-2 text-white rounded-xl transition-all duration-700 bg-gradient-to-tl to-gray-300 via-gray-600 from-white bg-size-200 bg-pos-0 hover:bg-pos-100 '>View More <i className="fa-solid fa-caret-down px-1"></i></button>
        </div>
      </section>
      {/* Swiper Text */}
      <section>
         <div className='container font-comfortaa text-center'>
          <p className='text-lg'>new member of our family</p>
          <p className='tracking-wide font-black text-[30px] text-cyan-800'>Bugatti Chiron will be available for you soon at <span className='text-5xl text-transparent tracking-tight bg-gradient-to-tl bg-clip-text  from-cyan-800 from-10% via-gray-300 via-45%  to-cyan-800 to-100%'>REES</span></p>
        </div>
      </section>
      {/* Swiper Section */}
      <section>
        <SwiperCard/>
      </section>
    </>
  )
}

export default Homepage