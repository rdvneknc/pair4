import React from 'react';
import BlogPostCard from '../../components/BlogPostCard/BlogPostCard'; 

const ArticlePage = () => {
  const [rating, setRating] = React.useState<number>(0); // rating durumu

  // Related posts verileri
  const relatedPosts = [
    {
      id: 1,
      title: 'The Future of Car Rentals',
      thumbnail: '/images/carimage1.jpg',
      excerpt: 'Explore how technology is transforming the car rental industry.',
      publishDate: '2024-02-15'
    },
    {
      id: 9,
      title: 'Discover Scenic Routes',
      thumbnail: '/images/carimage2.jpg',
      excerpt: 'Explore breathtaking landscapes and hidden gems with our premium car rental services.',
      publishDate: '2024-02-15'
    },
    {
      id: 2,
      title: 'Road Trip Essentials',
      thumbnail: '/images/carimage3.jpg',
      excerpt: 'Plan the ultimate road trip adventure with our essential tips and advice for a smooth journey.',
      publishDate: '2024-02-15'
    }
  ];

  const handleRatingChange = (value: number) => {
    setRating(value); // rating update
  };

  return (
    <div className="container mx-auto py-12">
      <div className="max-w-7xl mx-auto">
        {/* Title */}
        <h1 className="text-3xl lg:text-4xl font-bold mb-4">The Future of Car Rentals</h1>
        {/* Publish Date */}
        <div className="text-gray-600 mb-4">
          <span>Published: 2024-02-15</span>
        </div>
        
        {/* Content */}
        <div className="bg-blue-50 p-6 rounded-lg" style={{ fontSize: '1.05rem' }}>
          <p>The car rental industry has come a long way since its inception, and it continues to evolve rapidly with advancements in technology and changing consumer preferences. In this article, we'll explore some key trends shaping the future of car rental and how they're revolutionizing the way we travel.</p>
          <br />
          <p>1. Electric and Autonomous Vehicles</p>
          <br />
          <p>One of the most significant trends in the car rental industry is the shift towards electric and autonomous vehicles. As concerns about environmental sustainability grow, more rental companies are expanding their fleets to include electric cars, offering customers a greener alternative to traditional gasoline-powered vehicles. Additionally, the development of autonomous driving technology is paving the way for self-driving rental cars, providing a glimpse into a future where transportation is safer, more efficient, and more convenient than ever before.</p>
          <br />
          <p>2. Mobile Integration and Contactless Services</p>
          <br />
          <p>Another major trend in the car rental industry is the integration of mobile technology and contactless rental services. With the proliferation of smartphones, rental companies are investing in mobile apps that enable customers to book, manage, and unlock rental cars directly from their devices. This seamless integration not only enhances the rental experience by eliminating the need for physical paperwork and key exchanges but also provides greater flexibility and convenience for travelers on the go.</p>
          <br />
          <p>3. Personalized Experiences and Subscription Models</p>
          <br />
          <p>As consumer preferences continue to evolve, car rental companies are focusing on delivering personalized experiences and flexible subscription models. From curated vehicle selections to tailored service packages, customers now have more options than ever to customize their rental experience according to their specific needs and preferences. Additionally, subscription-based models are gaining popularity, offering customers the convenience of unlimited rentals for a fixed monthly fee.</p>
          <br />
          <p>4. Sustainable Practices and Corporate Responsibility</p>
          <br />
          <p>In response to growing environmental concerns, car rental companies are increasingly adopting sustainable practices and demonstrating corporate responsibility. From investing in eco-friendly vehicles to implementing green initiatives in their operations, rental companies are prioritizing sustainability as a core value. By embracing sustainable practices, these companies not only reduce their environmental footprint but also appeal to environmentally conscious consumers who prioritize eco-friendly options.</p>
          <br />
          <p>In conclusion, the future of car rentals is filled with exciting possibilities, driven by innovation, technology, and changing consumer demands. As the industry continues to evolve, we can expect to see further advancements in electric and autonomous vehicles, seamless mobile integration, personalized experiences, and sustainable practices. By staying ahead of these trends and embracing innovation, car rental companies can thrive in a rapidly changing landscape and provide customers with unparalleled experiences.</p>
        </div>
      </div>
      
      <br />
      
      <div className="flex items-center justify-center mb-4">
        <span className="mr-2 text-lg">Rate this article:</span>
        {[1, 2, 3, 4, 5].map((value) => (
          <button
            key={value}
            onClick={() => handleRatingChange(value)}
            className={`text-3xl ${value <= rating ? 'text-yellow-500' : 'text-gray-400'} focus:outline-none`}
          >
            ★
          </button>
        ))}
        <span className="ml-2 text-sm text-gray-500">1709 ratings</span>
      </div>

      {/* Related posts */}
      <div className="container mx-auto py-12">
        <h2 className="text-3xl font-bold mb-6">Related Posts</h2>
        <div className="grid grid-cols-1 md:grid-cols-3 gap-28">
          {relatedPosts.map(post => (
            <BlogPostCard key={post.id} post={post} />
          ))}
        </div>
      </div>
    </div>
  );
};

export default ArticlePage;
