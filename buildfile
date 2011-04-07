# Generated by Buildr 1.3.3, change to your liking
# Standard maven2 repository

repositories.remote << 'http://repo2.maven.org/maven2'
repositories.remote << 'http://www.ibiblio.org/maven2'

KRYO = artifact( 'com.esotericsoftware:kryo:jar:1.03' ).from( file( 'lib/kryo-1.03.jar' ) )
REFLECTASM = artifact('com.esotericsoftware:reflectasm:jar:0.9').from(file('lib/reflectasm-0.9.jar'))
MINLOG = artifact('com.esotericsoftware:minlog:jar:1.2').from(file('lib/minlog-1.2.jar'))
ASM = 'asm:asm:jar:3.2'
JODA_TIME = 'joda-time:joda-time:jar:1.6'
CGLIB = transitive( 'cglib:cglib:jar:2.2' )
WICKET = transitive( 'org.apache.wicket:wicket:jar:1.4.7' )
#SPRING_VERSION = '2.5.6'
#SPRING_CORE = transitive( 'org.springframework:spring-core', :version => '2.5.5' )
SPRING = group( 'spring-core', 'spring-beans', 'spring-aop', :under => 'org.springframework', :version => '2.5.6' )
SERVLET_API = 'javax.servlet:servlet-api:jar:2.5' # for tests with WicketTester
SLF4J = transitive( 'org.slf4j:slf4j-log4j12:jar:1.5.6' ) # for wicket stuff required but not pulled in
JUNIT = 'junit:junit:jar:4.7' # for WicketTester required
CLANG = 'commons-lang:commons-lang:jar:2.4' # test with some Integer subtype

desc 'Kryo/binary serialization strategy'
define 'kryo-serializers' do
  project.group = 'de.javakaffee'
  project.version = '0.8'

  compile.using :source=>'1.5', :target=>'1.5'
  test.using :testng

  compile.with( KRYO, REFLECTASM, ASM, MINLOG, JODA_TIME, CGLIB, WICKET, SPRING )
  test.with( compile.dependencies, SERVLET_API, SLF4J, JUNIT, CLANG )
  package :jar
  package(:jar, :classifier => 'sources').include :from => compile.sources 
  package :javadoc

end
