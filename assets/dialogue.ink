VAR companyName="DigiSoft"
VAR companyValue="open-source"
VAR playerName="Hatim"
VAR icName="Alex"
VAR field="Tech"
VAR cvStrength=0 //this would go from 0 to 10(?), and indicate how strong your resume is
VAR boredom=0       //the three emotion values      boredom is negative
VAR offense=0       //                              offense is negative
VAR impress=0       //                              impress is positive

VAR boredLast=false       //was the last neg answer a boring one?

// The characters are   PC: Player Character
//                      IC: Interviewer Character
// IC emotions: happy, apologetic, business, joking, thinking, interested, impressed, dazzled, incredulous, confused, offended, skeptical, bored, disappointed

-> start

=== start ===
= beginning
IC:(happy) Hi! Nice to finally meet you.
How are you doing today?
+   Good, how are you?
    PC: I'm good! How are you doing?
    IC:(happy) I'm also doing alright. Thanks for asking.
+   A little nervous.
    PC: Not too bad. A little nervous if I'm being honest.
    IC:(apologetic) Oh, please don't be.
    ->start.littleChat
+   Uhm
    PC: ...
    IC:(happy) Uhm... Can you hear me well?
    PC: Yeah, I can hear you fine.
    IC:(awkward) Okay. Um. I asked you how you're doing.
    PC: Sorry, yeah. My mind lagged for a bit.
    I'm okay.
    IC: (neutral) No worries. I understand this can be a bit stressful.
    ->start.littleChat
- ->getStarted

=getStarted
- IC:(happy) Ok! Should we get started now?
(business)So, of course, we already know a little bit about you.
(thinking)I read through your resume, and it was...
{
-   cvStrength<3:
    (awkward)...Unique, to... say the least.
-   cvStrength<6:
    (business)...good. You seem to check some of our boxes.
-   cvStrength<8:
    (happy)...pretty good! You seem to check a lot of our boxes.
-   else:
    (impressed)...stellar, if I'm being honest.
    (joking)I hope you haven't lied about anything on it. Haha.
}
But regardless, let's do some introductions, shall we?
-> introductions

=littleChat
IC:This is just a little chat for us to get to know each other, and to see if you're a good fit.
+   So I'm not hired yet?
    PC: So I'm not hired yet?
    IC:(awkward) Haha, unfortunately not. But who knows what might happen.
+   That sounds good.
    PC: Yeah, that sounds good.
+   Uhm.
    PC: ...
    IC:(happy) ...
- ->getStarted

=== introductions ===
IC:(happy)So my name is {icName}, and I'm the hiring manager here at {companyName}.
I've been working here for about 4 years now, and...
One fun fact about me is that I love baking.
Do you wanna go ahead?
+   My name is...
    ~GoodAnswer(1)
    PC: Sure. My name is {playerName}.
    -> introductions2
+   I'm your new recruit.
    PC: I'm your new recruit.
    ~WeirdAnswer(1)
    IC:(confused) Uhm...
    Is that... how you pronounce it?
    PC: Sorry. No. Haha. That was a joke. I'm {playerName}.
    -> introductions2
+   Uhm.
    PC:(bored) Um. An Introduction. Right...
    I don't know where to start... hahaha. I mean, who even am I?
    ~BoringAnswer(1)
    IC:(bored) Why don't we start with your name?
    PC: Oh, sure, yeah. Haha. I'm {playerName}.
    -> introductions2
    
=== introductions2 ===
+  I have a few pets... 
    ~WeirdAnswer(1)
    PC: (confused)I have a two cats and one dog. I love them dearly.
+  I graduated from...
    ~GoodAnswer(1)
    PC: I graduated from NYU last year.
+  Uhm
    PC: Uh.
    ~BoringAnswer(1)
    That's it. I don't really know what else to say.
    IC:(bored) Ok... Well, moving on...
    -> whyUs
-  And then...
+  I've always wanted to work in...
    ~GoodAnswer(1)
    PC: I've always wanted to work in {field}.
+  I like gardening.
    ~GoodAnswer(1)
    PC: I really like gardening!
+  Uhm
    PC: Yeah, that's all I have to say for now.
- IC:({SpecialEmotion()}) Ok! Again, nice to meet you. Moving on...
-> whyUs

=== whyUs ===
IC:({SpecialEmotion()}) Tell me, why did you apply to work with us?
In other words, why {companyName}?
+   You pay well.
    ~WeirdAnswer(1)
    PC: One of my friends works at yours, and they told me that you people pay pretty well.
    I'd like to get in on that, if you catch my drift. Haha!
    IC:(incredulous) I suppose... our packages can be considered competitive in this market, sure.
+   We have the same values.
    PC: I believe that we share similar values, {companyName} and me. Namely...
    ++  {companyValue=="open-source"} Fun.
        ~WeirdAnswer(1)
        Fun.
        You people are all about maximizing fun. For the customers, for the employees. I'm the same way.
        IC:(incredulous) We... do?
        What makes you think we're this way?
        (awkward)Not that we're against fun, or anything.
        PC: Oh! Well.
        ({SpecialEmotion()})I got that... from your company website?
        Yeah, it was designed... in a fun way.
        Yup.
    ++  {companyValue=="open-source"} Open-source.
        Open-source.
        ~GoodAnswer(1)
        I know that {companyName} cares a lot about making software that is transparent and accessible to everyone.
        In fact, I myself learnt a lot from studying your code and trying to see what works...
        ...So it would mean a lot to me if I could be a part of {companyName} and contribute to the democratization of information.
        IC:({SpecialEmotion()}) I see.
        IC:(impressed) That's very good. We like to see this kind of spirit in our recruits.
+   Uhm
    PC: You seemed... 
    ~BoringAnswer(1)
    PC: Like pretty cool people?
    IC:(disappointed) ...
    IC:(skeptical) Thank you. We appreciate it.
- IC:({SpecialEmotion()}) Ok. Let's see what's next on the list.
-> weakness

=== weakness ===
IC:({SpecialEmotion()}) So you seem like a very promising young person.
But now, I would like to know...
What would you say is your biggest weakness?
+   Say something honest.
    PC: If I'm being honest, my biggest weakness would be...
    ++  Something skill-related.
        {companyName=="DigiSoft"} I'm not very familiat with one of the tools I know you're using, PyAudio.
        +++ But I'm willing to learn.
            ~GoodAnswer(1)
            But I am willing and read to learn about it once we get started.
            As you could probably tell from my resume and portfolio, there's a lot of skills that I quickly had to pick up in the past, so this doesn't scare me.
        +++ That's gonna be hard.
            ~WeirdAnswer(1)
            So... that might make things a little hard for me.
            IC:(confused) Okay...
            Well, thank you for your honesty.
        +++ Uhm
            PC: ...
            ~WeirdAnswer(1)
            IC:(confused) Okay...
            Well, thank you for your honesty.
    ++  Something personal.
        I'm a bit socially awkward.
        I don't feel very comfortable interacting with new people, and it often shows in the way I act or talk.
        +++ It sucks.
            ~WeirdAnswer(1)
            It kind of sucks. Makes my life harder than it needs to be.
            IC:(incredulous) Well I'm... sorry to hear that.
        +++ But it gets better.
            ~GoodAnswer(1)
            But this is something that I'm keenly aware of, and it gets better once I'm more familiar with the environment and the people I talk to.
        +++ Uhm
            PC: ...
            ~BoringAnswer(1)
            IC:(skeptical) Ok. That is good to know.
    ++  Uhm
        ...
        PC: My biggest weakness is...
        I'm not very good at job interviews.
        I don't do very good with stress and questions I'm unprepared for. I kind of just blank.
        IC:(neutral) Oh?
        ~GoodAnswer(1)
        {
        - impress>3:
            IC:({SpecialEmotion()}) Well, you had me fooled. I'd say you've been doing pretty good so far.
        - else:
            IC:({SpecialEmotion()}) Well, I appreciate your honesty.
        }
        IC: Do let me know if there's anything I could do to make you more at ease.
        PC: I'll be alright. Thanks
+   Say something that makes you look good.
    ~BoringAnswer(1)
    PC: Perfectionism. For sure.
    IC:(skeptical) Do you wanna tell me more about that?
    PC: Yeah. You know, everytime I'm working on something, I always need to continue tinkering with it until I think it's perfect.
    It can get exhausting but... what can you do?
    (bored)That's just the way I am, I guess.
    IC:(happy) Does that mean you're fine with a little bit of unpaid overtime?
    ++  Yes.
        ~GoodAnswer(1)
        Yeah, that's okay.
        Like I said, anything in orderto deliver the best product possible.
        IC:(dazzled) That is wonderful to hear!
        (happy) Too many young people these days think they can just check in and out at the end of their shift. They don't care about the real value of work...
        (impressed)I'm glad to hear you're not like that.
        PC: Yup... Totally.
    ++  No.
        ~WeirdAnswer(1)
        PC: I... would rather not do that, if I'm being honest.
        Even a perfectionist like me has their limit. Haha.
        IC:(incredulous) Understood.
    ++  Uhm.
        PC: Maybe we can talk about this... later?
        I mean, I'm  still getting to know you and my potential responsibilities, so...
        IC:(neutral) Alright. Sure. 
+   Uhm
    PC: A weakness, huh...
    ~BoringAnswer(1)
    I can't really think of anything.
    IC:(bored) Really? Not a single one?
    PC: ...
    PC:(disappointed) Nope. None.
    IC: ...Very well.
- IC:({SpecialEmotion()}) Let's move on now.
-> questions

=== questions ===
IC:({SpecialEmotion()}) So... I believe we're nearing the end of the interview.
Do you have any questions for us?
+   Yes.
    PC: Yeah, thank you for bringing it up.
    I want to ask about...
    ++  Your company culture.
        ~GoodAnswer(1)
        ...The company culture. What's it like working at {companyName}?
        IC:(thinking) Hmm. Well...
        (neutral)We have a big focus on the mentor-mentee relationship. So once someone new is on-board, they get a mentor assigned who has to check in with them every week or so.
        (happy)And once someone works for a little bit at the company, they start having their own mentors.
        (thinking)We want everyone to be able to learn from each other as more than just coworkers. This also helps our new recruits feel more welcome.
        (interested)Does that answer your question?
        PC: Yes. Thank you!     // add more questions at this point?
    ++  The pay.
        ~WeirdAnswer(1)
        ...The pay. How much are we talking here?
        IC:(awkward) Oh, well, uh, if we like your profile then we'll be sure to send you an offer but...
        It's still a bit early to have... that kind of talk.
        ({SpecialEmotion()}) I hope you understand.
+   No.
    ~WeirdAnswer(1)
    PC: No, I think I know everything I need to know.
+   Uhm
    PC: ...
    IC: Is that a no...?
    PC: Yeah. I mean, no.
    ~BoringAnswer(1)
    No questions.
- IC:({SpecialEmotion()}) Very well. If there's nothing left...
-> goodbyes


=== goodbyes ===
IC:({SpecialEmotion()}) I believe we're done here. Thank you very much for making the time to meet me!
+   Pleasure's all mine.
    ~GoodAnswer(1)
    PC: The pleasure is all mine. Thank you for this talking opportunity.
    IC:(business) Of course.
+   See ya!
    ~WeirdAnswer(1)
    PC: See ya!
+   uhm
    PC: ...
    ~BoringAnswer(1)
    IC:({SpecialEmotion()}) ... 
- IC:({SpecialEmotion()}) Alright. 
{
- impress>4:
    IC:({SpecialEmotion()}) I'm sure we will talk again soon.
- impress>1:
    IC:({SpecialEmotion()}) Hopefully we'll talk again soon.
- else:
    IC:({SpecialEmotion()}) I wish you luck with all your future endeavors.
}
IC: Goodbye!
-> END



// Functions

=== function GoodAnswer(x) ===
{   boredom>0 || offense>0:
        {boredom>=x:
             ~ boredom=boredom-x
        - else:
            ~ boredom=0
        }
        {offense>=x:
             ~ offense=offense-x
        - else:
            ~ offense=0
        }
    - else:
        {impress+x<=6:
            ~impress=impress+x
        - else:
            ~impress=6
        }
}

=== function BoringAnswer(x) ===
{   
- impress>=x:
    ~impress=impress-x
- impress>0:
    ~ impress=0
- else:
    {boredom<=6+x:
         ~ boredom=boredom+x
    - else:
        ~ boredom=6
    }
}
~boredLast=true

=== function WeirdAnswer(x) ===
{   
- impress>=x:
    ~impress=impress-x
- impress>0:
    ~ impress=0
- else:
    {offense<=6+x:
         ~ offense=offense+x
    - else:
        ~ offense=6
    }
}
~boredLast=false

=== function SpecialEmotion ===
{   
- impress>4:
    ~ return "dazzled"
- impress>2:
    ~ return "impressed"
- impress>0:
    ~ return "interested"
- boredom>0 && (boredom>offense || (boredom==offense && boredLast)):
    {
    - boredom>4:
        ~ return "disappointed"
    - boredom>2:
        ~ return "bored"
    - boredom>0:
        ~ return "skeptical"
    }
- offense>0 && (offense>boredom || (boredom==offense && !boredLast)):
    {
    - offense>4:
        ~ return "offended"
    - offense>2:
        ~ return "confused"
    - offense>0:
        ~ return "incredulous"
    }
- else:
    ~return "neutral"
}

