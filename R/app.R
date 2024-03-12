library(shiny)
library(ggplot2)
library(shinyjs)
library(shinyBS)
library(shinyalert)
library(gt)


source("setup_data_frames.R")

# ******************************** #
# *** setting variable options *** #
# ******************************** #
variable_options <- c("gender", "race", "first_gen", "international", "major", "prep", "work_status", "none")
names(variable_options) <- c("Gender", "Race", "First Gen", "International", "Major", "Preparedness", "Work Status", "None")

# ********************** #
# *** main ui layout *** #
# ********************** #
ui <- fluidPage(
  useShinyjs(),
  fluidRow(
  titlePanel("DEI in Tech Climate Survey Interactive Report"),
  tabsetPanel(id = "inTabset",

  # ******************* #
  # *** welcome tab ***
  # ******************* #
  tabPanel( ## welcome tab (open) ##

    "Welcome", value = "panel1",
    mainPanel(style = "margin-left: 13%; margin-right: 15%; width: 75%",

    # *** Introduction *** #
    h1(style = "text-align: center", "Welcome to the 2022 DEI in Tech Climate Survey Report"),
    p("This report is brought to you by the DEI Tech Collective.The Collective is an opportunity
      for BU tech and computing groups to unite around efforts to educate each other
      and address inequity issues within the community."),
      br(),
      p("To learn more about our initiative, visit the",
        a("DEI Tech Collective website.", href = "https://sites.bu.edu/dei-in-tech/")),

      hr(),

      # *** About the Survey *** #
      h3("What is the DEI in Tech Climate Survey?"),
      p("The DEI in Tech Climate Survey was curated by Shateva Long (CAS '23)
        and was administered in the Spring of 2022 by the BU DEI Tech Collective.
        The purpose of this survey was to assess the climate of tech departments
        at Boston University and begin to fill that data gap. This survey was
        intended for students in Computer Science, Math and Stats, Computing and
        Data Science, Information Systems, and Computer Engineering. The survey
        was modeled after already existing climate surveys from various institutions,
        including the University of Michigan Computer Science and Engineering
        Climate, Diversity, Equity, and Inclusion Assessment and assessments
        from the Computing Research Association."),

      # *** What can I do on this site? *** #
      h3("What can I do on this site?"),
      p("Navigate to the “Survey Report” tab to view the entire Climate Survey Report. This page includes:"),
      tags$li("Additional survey background details"),
      tags$li("BU population data overview"),
      tags$li("Display of respondent demographics"),
      tags$li("Explanations of survey sections and accompanying trends"),
      tags$li("Disclaimers and challenges to be aware of"),

      p("\n"),

      p("Navigate to the “Build-a-Graph” tab to interact with the data yourself.
        Here you can select specific questions from the survey and filter by variables
        to better understand how different types of students responded. Information
        on the “General Report” tab will help with the interpretation of the data
        results that you compile."),

      # *** How do I use Build-a-Graph? *** #
      h3(id = "how", "How do I use Build-a-Graph?"),
      strong("How to Build a Graph"),
      tags$ol(
        tags$li("Select a section or question type from the survey"),
        tags$li("Choose the particular question of interest"),
        tags$li("To view breakdowns of the selected question by demographic
                attributes, identify the variable of interest. The variable
                option 'Preparedness' refers to student responses to the
                question, 'AFTER you completed your first few STEM courses
                at BU, do you feel like your high school adequately prepared
                you for college? Or in other words, once you experienced the
                difficulty level of college courses, did you feel like your
                high school prepared you?'. The variable option 'Work Status'
                refers to student responses to the question, 'Do you have a job?'.")
        ),

      strong("How to Read the Graphs"),
      tags$ol(
        tags$li("When a variable is not selected (or 'none' selected), the top graph,
                ‘count’, displays the total number of students that selected each
                response. When a variable is selected, the responses will be broken
                down by the selected variable. This means if the variable ‘gender’
                is selected, the values in this graph will show the number of self-
                identified female students, self-identified male students, etc. that
                selected each response."),
        tags$li("When a variable is not selected (or 'none' selected), the bottom graph,
                ‘prop’, displays the total number of students that selected each response,
                in proportion to the total number of students that responded to the
                question. When a variable is selected, the responses will be broken
                down by the selected variable. This means if the variable ‘gender’
                is selected, the values in this graph will show the number of
                self-identified-female students, self-identified male students, etc.
                that selected each response, in proportion to the total number of
                self-identified female students, self-identified male students etc.
                that responded to the question."),
         ),

      strong("Example: "),
      p("The graph below is the data for the question, 'Have you ever experienced discrimination
        or disrespectful/inappropriate behavior in your major department?' and the gender variable
        is selected.In the top graph, when looking at the values for the 'No' response, female (the
        red bar) has a value of 110. This means 110 self-identified female students responded No.
        In the bottom graph, when looking at the values for the 'No' response, female (the red bar)
        has a value of 64%. This means 64% of all self-identified female students responded No."),
      column(6, imageOutput("photo1", height = "50%", width = "50%"), align = "center")
      ),
  ), ## welcome tab (close) ##

  # ************************* #
  # *** survey report tab *** #
  # ************************* #
  tabPanel( ## survey report tab (open) ##

    "Survey Report",
    mainPanel(style = "margin-left: 13%; margin-right: 15%; width: 75%",

    h1(style = "text-align: center", "Survey Report"),
    p("Thank you for your interest in the DEI in Tech Student Climate Survey.
      This campaign was motivated by the need to better understand student
      experiences in tech related departments at BU in an effort to inform
      areas for change and improvement. Please read on to learn more."),

    hr(),

    # ** Executive Summary ** #
    h3("Executive Summary"),
      p("The purpose of the DEI in Tech Climate Survey was to assess the climate of tech departments
        at Boston University and begin to fill that data gap. Areas across the university are determining
        new goals and policies to address inequity, and the data gathered here is meant to contribute to
        the evidence based formation of effective initiatives."),
      p("This report provides overviews of the survey background and methods. Some BU student population
        data is shared for context, as well as an outline of the 632 respondent demographics to shed light
        on the types of students who participated. The segments following include explanations of survey
        sections, and associated examples and general analysis of results. More detailed data results for
        each part of the survey can be compiled on the interactive “Build-a-Graph” tab."),
      p("Experiences of culture, environment, and belonging are complex. To summarize what was discovered
        with this survey, it’s important to acknowledge that fact. Broadly, survey responses point to
        somewhat favorable experiences within departments and at BU. Within that overall assessment, there
        are many areas where a sizable percentage of students indicate negative feelings or interactions
        that need to be addressed. Finally, once responses are evaluated through breakdowns of demographics
        like race, gender, international status, and first generation status, the nuances in experiences
        are demonstrated. Unfavorable experiences tend to be overrepresented in historically excluded populations.
        Examples of these patterns are included in the survey sections in part 5 below. "),

    # **************** #
    # ** Background ** #
    # **************** #
    h3("Background"),

    # ** Survey Background ** #
    h4("Survey Background"),
      p("We believe a collective goal of the computing department leaders, faculty, staff, and
        Boston University, is to create a substantial and successful learning environment for
        all students. In order to do that, we need to truly understand the current state of the
        environment and how students are feeling. This was the main purpose of the climate survey.
        We wanted to better understand student experiences which would allow us to better capture
        what is currently working and what is not working within computing fields at BU. We also
        wanted to discover whether there were any unorthodox differences between student experiences
        and what could possibly be creating those disparities. This is a very important piece to this
        research since as BU and tech in particular continues to grow and become more diverse, we need
        to make sure that these spaces are equitable. We hope that our findings can be of use to others
        who are willing and able to work on projects related to bettering student outcomes and other DEI
        related goals."),

    # ** Survey Objectives ** #
    h3("Objectives"),
      p("What are overall experiences of students within technology groups of computing,
        data & computational sciences, math & stats, and engineering at BU?"),

      tags$li("What are their experiences like with professors, peers, departments, and the broader BU community?"),
      tags$li("What are students particularly happy or unhappy with?"),
      tags$li("What are students particularly unhappy with?"),
      tags$li("Do student experiences differ with particular identities? If so, how do they?"),

    ## ** Survey Methods ** ##
    h3("Administering the Survey"),
      p("Disclaimer: this survey was entirely voluntary, therefore there may be issues of self selection bias
        in the results. Outreach efforts consisted of physical signage around campus, social media promotion,
        newsletters, and the visiting of classrooms with large numbers of students. Incentives included moments
        where complimentary food was offered, as well as a raffle prize for those who responded."),
      p("In attempts to foster a safe forum for students to make their voices heard, all survey responses are
        completely anonymous. And no question was required; students could choose to skip a question. All of
        the factors detailed here do mean that the responses received are not directly representative of the
        numbers in each department, nor their demographic makeup. This should be understood while simultaneously
        acknowledging that the experiences shared in the survey remain valid and are important to consider in the
        initiatives to improve department practices and culture."),

    ## ******************** ##
    ## ** Survey Results ** ##
    ## ******************** ##
    h3("Results"),
      ## ** Demographics ** ##
      h4("Respondent Demographics Summary"),
        p("Total responses: 632"),
        p("Disclaimer: In attempts to foster a safe forum for students to make their voices heard, no survey
          question was required; students could choose to skip a question. Additionally, some questions would
          only display if the student responded in a particular way to a previous question. For example, if a
          student indicated that they were a computer engineering major or minor, then they would receive course
          satisfaction questions for the relevant set of associated computer engineering courses. These details
          explain why results for each question may not total 632. "),

          ## ** Demographics: Gender ** ##
          h5("Gender"),
            p("Students were asked to indicate their gender/gender identity. They were allowed one selection and
              provided options of: ‘male’, ‘female’, ‘non-binary’, ‘I don’t wish to disclose’, and ‘preferred
              response not listed’ with a free text field."),
            p("Disclaimer: the determination to include this list of responses was to remain consistent with common
              measures across higher education and simplify data comparisons with other institution’s surveys. While
              hoping to ensure all identities could be included with the addition of a preferred response field, it’s
              important to note the makeup of this list may possibly communicate a narrower definition of gender.
              Gender identity can be fluid and shift over time."),

            column(6, tableOutput("gender_table"), align = "center"),
            column(6, plotOutput("gender_plot")),

          ## ** Demographics: Race ** ##
          h5("Race"),
            p("When asking students to self identify their race and/or ethnicity, the survey allowed for the
              selection of multiple options. This enabled the capture of the breadth of racial and ethnic identity."),

            column(6, tableOutput("race_table"), align = "center"),
            column(6, plotOutput("race_plot")),

          ## ** Demographics: First-Generation Status ** ##
          h5("First-Generation Status"),
            p("Students were asked if they were a first generation college student, and given a definition of
              ‘Your parents/legal guardians did not attend college’. They were allowed one selection and provided
              an ‘I don’t know’ and an ‘I don’t wish to disclose’ option."),

            column(6, tableOutput("firstgen_table"), align = "center"),
            column(6, plotOutput("firstgen_plot")),

          ## ** Demographics: Major ** ##
          h5("Major"),
            p("Students were provided a list of majors, including an ‘other’ option with a free text field,
              and asked to make one selection. Additionally, students were asked if they minored in the available
              subjects, and again were provided a ‘no’ and an ‘other’ selection with a free text field."),

            plotOutput("major_plot"),
            column(12, tableOutput("major_table"), align = "center"),

          ## ** Demographics: International Status ** ##
          h5("International Status"),
            p("Students were asked if they were an international student. They were allowed one selection and
              provided an ‘I don’t wish to disclose’ and an ‘other’ option, with a free text field. "),

            column(6, tableOutput("international_table"), align = "center"),
            column(6, plotOutput("international_plot")),

            p("Overall Disclaimer: there are many other ways an individual can identify that are not
              included in the demographics collected with this survey. Please refer to the Conclusion
              section at the end of this page for further information."),

    ## ** Course and Department Satisfaction ** ##
      h4("Course and Department Satisfaction Summary"),
        p("The course satisfaction section asked respondents to identify their level of satisfaction with
          instructional support (support from professors) in classes within their major. For a particular
          class, a student indicates they are extremely satisfied, somewhat satisfied, neither satisfied
          or dissatisfied, somewhat dissatisfied, extremely dissatisfied, or did not take that course. This
          was compiled to provide the overall department satisfaction as well."),
        p("This results section spans many courses and departments, resulting in varied responses across
          majors as well as individual courses. Therefore, any trends will not be detailed here. The flexibility
          of the “Build-a-Graph” tab will allow you to filter down to a particular department and/or course
          of interest. "),

    ## ** Agreement with Experiences ** ##
      h4("Agreement with Experiences"),
        p("The agreement with experiences section asked respondents to identify their level of agreement with
          various experiences by selecting an option of strongly disagree, disagree, agree, and strongly agree.
          These experiences encompassed a range of areas that may be present in student life: interactions with
          professors, interactions with peers, treatment by departments, and general personal feelings.
          Examples include:"),

          tags$li("Professors care about me"),
          tags$li("I feel like I'll be judged by my peers if I make a mistake "),
          tags$li("I feel like an outsider"),
          tags$li("I am satisfied with the social climate at my major's department"),
          tags$li("I am treated fairly and equitably by staff in my major"),

        p("The comprehensive list of statements can be found in the Build a Graph Tab. "),
        p("In identifying levels of agreement with many aspects of student life, respondents do point to more
          positive interactions than negative. Some of the statements captured only slight differences between
          response rates. For example, a large majority of students respond that they ‘agree’ or ‘strongly agree’
          with the statement, ‘I am treated fairly and equitably by my peers in my major.’ For the most part,
          this remains the case when controlling for gender, race, international status, or first generation
          status."),
        p("Alternatively, there are a number of statements indicating a larger discrepancy between students with
          different identities. One statement reflecting this is ‘I am satisfied with the social climate at my
          major's department.’ Students who identify with historically underrepresented race/ethnicities respond
          that they ‘agree’ or ‘strongly agree’ much less than their White or Asian counterparts; 35% of Middle
          Eastern students, 53% of Black students, and 60% of Hispanic or Latinx students compared to 80% and 79%
          of Asian and White students, respectively. This is an interesting result. It shows that the majority of
          students do feel somewhat positively with their department’s climate. However, those numbers could still
          be improved quite a bit. And of course, as the racial breakdown is reviewed, there is a large discrepancy
          in student attitudes, with negative experiences expressed by racially minoritized students at much higher
          rates."),
        p("An additional example of discrepancies between student identities appears with the statement, ‘I have to
          work harder than others to be valued equally within my major.’ Disaggregating results by first generation
          status, 65% of those who identify as first generation students indicate that they ‘agree’ or ‘strongly agree’
          with this statement. Responses show that 49% of students who are not first generation respond that they ‘agree’
          or ‘disagree’. Overall, these numbers are quite high and should be considered as an area to address in general,
          however as response rates are assessed through the lens of student characteristics, the differences in experiences
          should be noted."),

    ## ** Rating using Adjectives ** ##
      h4("Rating using Adjectives Summary"),
        p("The rating using adjectives section asked respondents to rank the department of their major on a scale from 1-5,
          with each end of the scale being an adjective. For example, one pair of adjectives were hostile and friendly, with
          1 representing hostile and 5 representing friendly. A response of 5 ranks the major department closer to friendly
          whereas a response of 2 ranks the department closer to hostile. The adjectives on the right end of the spectrum are
          generally more positive but this is not true for all of the pairs of adjectives. A few pairs may be seen as more
          neutral in morality. When comparing adjectives “A” and “B”, responses 1-5 can be interpreted as “Definitely A”,
          “Somewhat A”, “Neutral”, “Somewhat B”, and “Definitely B”, respectively. For a full list of the adjective ranges,
          please visit the Build a Graph Tab."),
        p("The majority of students feel as though their respective department is non-racist (83% of student responses between
          4-5), respectful (81% of student responses between 4-5), non-homophobic (80% of student responses between 4-5), and
          friendly (79% of student responses between 4-5)."),
        p("As for where more student responses fall closer to the left end of the spectrum towards 1, many students feel as
          though their department is either neutral or closer to being homogenous (19% of student responses between 1-2 and
          24% being 3), competitive (19% of student responses between 1-2 and 24% being 3), elitist (26% of student responses
          between 1-2 and 22% being 3), and individualistic (20% of student responses between 1-2 and 27% being 3). While these
          responses are not necessarily negative, depending on the values of departments, they may indicate areas where work can
          be done. If a goal for the departments is to not be elitist and instead be more accessible to all students, having 56%
          of respondents feel like their department is elitist or somewhere in the middle shows that goal is not currently being
          met. It is possible this competitive environment is contributing to the stress levels of students. In this survey, the
          majority of respondents indicated they are sometimes or often times stressed and a stressful environment can have a
          negative impact on a student’s ability to learn."),
        p("Student responses begin to slightly differ when the results are organized using other variables. When students were
          asked to rank their department on a scale between “Homogenous” and “Diverse”, the majority of Black students ranked their
          department between 1-3, with the median value being 2. This suggests that the Black students who responded to this survey
          rank their department as more homogenous than diverse."),

    ## ** Discrimination Encounters ** ##
      h4("Discrimination Encounters Summary"),
        p("The discrimination encounters section asked students about their direct experiences or observations of discrimination.
          These questions were:"),

        tags$li("Have you ever experienced discrimination or disrespectful/inappropriate behavior in your major department? This
                includes while being in lecture, office hours, or any other related space on campus."),
        tags$li("Have you ever witnessed discrimination or disrespectful/inappropriate behavior in your major department? This
                includes while being in lecture, office hours, or any other related space on campus."),

        p("These questions were then followed by an opportunity for the students to share any details of the incident with free text responses."),
        p("The majority of students who responded to the survey, reported never witnessing or experiencing discriminatory or
          disrespectful/inappropriate behavior in their major department. While the majority did not have these experiences,
          students who identified as a gender that is not male were more likely to respond with Yes or Maybe in comparison to
          students who identified as male. 24% of female students reported Yes and Maybe whereas 11% male students reported Yes
          and Maybe. "),
        p("When reviewing results of those who experienced discrimination broken down by race/ethnicity, the percentage of
          students who responded with ‘yes’ or ‘maybe’ is as follows: 26% of Hispanic or Latinx students, 23% Multiracial students,
          18% Middle Eastern, Asian, and Black students, and 10% White students. It’s a positive result that interactions
          like this are not experienced by a majority of students. However, the disparity here between minoritized students
          and their white counterparts is notable."),

    # **************** #
    # ** Conclusion ** #
    # **************** #
    h3("Conclusion"),
      p("With an overall lens on the survey data, many areas of climate in tech related departments at BU provide positive
        experiences for a broad swath of students. These successes can be leveraged in strengthening the other areas that
        need improvement. While survey numbers often indicated a majority leaning more favorable than unfavorable, it should
        still be acknowledged that a simple majority is not enough. Response rates illustrating positive experiences falling
        in the 50-60 range is not reasonable. And of course, there is parity in areas, and wide discrepancies in others. More
        specifically, as results are disaggregated by historically underrepresented and disadvantaged students, the experience
        of campus culture within these disciplines reflect more instances of negativity and less feelings of inclusion."),

        h5("Further exploration"),
        p("First, there are many other ways an individual’s experience is shaped that were not collected within the demographics
          and questions within this survey. Major gaps include focuses around those who are differently abled, sexual identity,
          language, religion, class, neurodiversity. These are important areas to be considered in future efforts. Additionally,
          a deeper analysis of experiences through intersectional factors will allow for more insight into the interactions students
          have with various parts of the campus community."),

        p("Stay tuned for additional information to be added to this report that includes the qualitative analysis of the focus
          groups conducted, and how they relate to or help explain the trends in this survey report.")
         )
  ),


  # ******************* #
  #  Build a Graph Tab  #
  # ******************* #
  tabPanel(
      "Build-a-Graph",

      sidebarLayout(
        sidebarPanel(

          # Assigning which year
          selectInput(
            "year",
            label = tags$span(
              "Select year", bsButton("y", label = "", icon = icon("info"), style = "info", size = "extra-small")),
            choices = c("2022", "2024"),
            multiple = FALSE,
            selected = "2022"
          ),

          # Year (Help)
          bsPopover(
            id = "y",
            title = "More information",
            content = paste0(
              "Select a year from the survey."
            ),
            placement = "right",
            trigger = "hover",
            options = list(container = "body")
          ),

          # Assigning Question Type (qtype) #
          selectInput(
            "qtype",
            label = tags$span(
            "Select question type",
            bsButton("q", label = "",
                      icon = icon("info"),
                      style = "info",
                      size = "extra-small")),
            choices = c("Agreement", "Adjectives", "Course Satisfaction", "Discrimination", "Miscellaneous"),
            multiple = FALSE,
            selected = "Agreement"
          ),

          # Question Type (Help) #
          bsPopover(
            id = "q",
            title = "More information",
            content = paste0(
              "Select a section or question type from the survey."
            ),
            placement = "right",
            trigger = "hover",
            options = list(container = "body")
          ),

          # Assigning University Department #
          selectInput(
            "dep",
            label = tags$span("Filter by course or by department?",
                              bsButton("depa", label = "",
                                       icon = icon("info"),
                                       style = "info",
                                       size = "extra-small")),
            choices = c("Course", "Department"),
            multiple = FALSE,
          ),

          # University Department (Help) #
          bsPopover(
            id = "depa",
            title = "More information",
            content = paste0(
              "View the course satisfaction for individual classes or view the total course satisfaction for courses within a department."
            ),
            placement = "right",
            trigger = "hover",
            options = list(container = "body")
          ),

          # Assigning Discrimination Question #
          selectInput(
            "question",
            label = "Select question",
            choices = NULL,
            multiple = FALSE
          ),

          # Assigning Participant Variable #
          selectInput(
            "variable",
            label = tags$span(
              "Select variable", bsButton("v", label = "", icon = icon("info"), style = "info", size = "extra-small")),
            choices = variable_options,
            multiple = FALSE,
          ),

          # Participant Variable (Help) #
          bsPopover(
            id = "v",
            title = "More information",
            content = paste0(
              "To view breakdowns of the selected question by demographic
              attributes, identify the variable of interest."
            ),
            placement = "right",
            trigger = "hover",
            options = list(container = "body")
          ),

          ## Build-a-Graph help ##
          p("Need help with reading the graphs?"),
          actionButton("help", "Help")

        ),
        mainPanel(
          plotOutput("freq_plot")
        )
      )
    )

  )),
  hr(),
  imageOutput("photo", height = "1%", width = "1%"),
  HTML("<p >Copyright	2023 &copy; by DEI Tech Collective</p>")

)

# ****************** #
#  Server Function   #
# ****************** #
server <- function(input, output, session) {
  observeEvent(input$help, {
    shinyalert("How to read the graphs",

    "1. Top Graph When a variable is not selected (or 'none' selected),
    the top graph, ‘count’, displays the total number of students that selected each response. When a variable
    is selected, the responses will be broken down by the selected variable. This means if the variable ‘gender’
    is selected, the values in this graph will show the number of self-identified female students, self-identified
    male students, etc. that selected each response.

    2. Bottom Graph When a variable is not selected (or 'none' selected), the bottom graph, ‘prop’, displays
    the total number of students that selected each response, in proportion to the total number of students that
    responded to the question. When a variable is selected, the responses will be broken down by the selected variable.
    This means if the variable ‘gender’ is selected, the values in this graph will show the number of self-identified-
    female students, self-identified male students, etc. that selected each response, in proportion to the total number
    of self-identified female students, self-identified male students etc. that responded to the question.

    3. Example
    For example, let’s say we’re looking at the question, 'Have you ever experienced discrimination or disrespectful/
    inappropriate behavior in your major department?' and the gender variable is selected. In the top graph, when
    looking at the values for the 'No' response, female has a value of 110. This means 110 self-identified female
    students responded No. In the bottom graph, when looking at the values for the 'No' response, female has a value
    of 64%. This means 64% of all self-identified female students responded No.

    Please return to the Welcome tab and scroll down to the, 'How do I use Build-a-Graph?' section if you'd like to see
    this example with the actual graph.",

    size = "l")
  })

  ## Question Type (Dropdown) ##
  observe({
    if(input$qtype == "Agreement"){
      updateSelectInput(session, "question",
                        choices = unique(agreement_q$question_text),
                        label = "Select agreement statement"
      )
    }
    if(input$qtype == "Course Satisfaction"){
      updateSelectInput(session, "question",
                        choices = unique(course_ldf$question_text),
                        label = "Select course",
                        shinyjs::show("dep")
      )
    }
    if(input$qtype == "Course Satisfaction" & input$dep == "Department"){
      updateSelectInput(session, "question",
                        choices = unique(dep_tbl$selected_q),
                        label = "Select department"
      )
    }
    if(input$qtype == "Course Satisfaction" & input$dep == "Course"){
      updateSelectInput(session, "question",
                        choices = unique(course_ldf$question_text),
                        label = "Select course"
      )
    }
    if(input$qtype == "Adjectives"){
      updateSelectInput(session, "question",
                        choices = unique(adjectives_q$question_text),
                        label = "Select adjectives to compare",
      )
    }
    if(input$qtype == "Miscellaneous"){
      updateSelectInput(session, "question",
                        choices = unique(misc_q$question_text),
                        label = "Select specific question",
      )
    }
    if(input$qtype == "Discrimination"){
      updateSelectInput(session, "question",
                        choices = unique(discrimination_q_tbl$selected_q),
                        label = "Select question"
      )
    }
    if(input$qtype != "Course Satisfaction")
      shinyjs::hide("dep")
  })


  output$photo <- renderImage({
    list(
      src = "techcollectivelogo.png",
      contentType = "image/png",
      height = "50px"
    )
  }, deleteFile = FALSE)

  output$photo1 <- renderImage({
    list(
      src = "example.png",
      contentType = "image/png",
      height = "450px"
    )
  }, deleteFile = FALSE)

  output$freq_plot <- renderPlot(
      {
      var <- input$variable

      if (input$qtype == "Course Satisfaction" & input$dep == "Course") {
        cdf = course_ldf #cdf = current dataframe
        graphTitle = paste("Survey Prompt: How satisfied are you in regards to the instructional support\n
                           (ex. support from professors) you've received in", input$question, "?")

      } else if (input$qtype == "Adjectives"){
        cdf = adj_ldf
        adj1 <- unlist(strsplit(input$question, split = ":"))
        graphTitle = paste("Survey Prompt: Please select one option between the following set of adjectives that best\n
                           represents how you would rate your major department based on what you have seen and/or\n
                           your own personal experience: ",
                           "1 = ", adj1, "and ", "5 = ", substring(input$question, nchar(adj1)+2, nchar(input$question)))

      }else if (input$qtype == "Agreement"){
        cdf = agreement_ldf
        graphTitle = paste("Survey Prompt: Please indicate your level of agreement with the following statement:\n", input$question)

      }else if (input$qtype == "Miscellaneous"){
        cdf = misc_ldf
        if (str_detect(input$question, "AFTER")) {
          graphTitle = paste("Survey Prompt: AFTER you completed your first few STEM courses at BU, do
                             you feel like\nyour high school adequately prepared you for college? Or in
                             other words, once you\nexperienced the difficulty level of college courses,
                             did you feel like your high school\nprepared you?")
        }else if (str_detect(input$question, "PRIOR")){
          graphTitle = paste("Survey Prompt: Did you feel prepared for college level courses within your
                             major PRIOR to\nentering BU? Or in other words, when you graduated from high
                             school, did you feel ready for\ncollege level courses?")
        }else{
        graphTitle = paste("Survey Prompt: ", input$question)
        }

      }else if (input$qtype == "Discrimination"){
        cdf = dis_ldf
        if (str_detect(input$question, "experienced")){
          graphTitle = paste("Survey Prompt:", "Have you ever experienced discrimination or disrespectful/inappropriate\n
                             behavior in your major department?")
        }else{
          graphTitle = paste("Survey Prompt:", "Have you ever witnessed discrimination or disrespectful/inappropriate\n
                             behavior in your major department?")
        }

      }else if (input$qtype == "Course Satisfaction" & input$dep == "Department"){
        cdf = course_ldf
        graphTitle = paste("This data represents the overall course satisfaction for all",input$question, "courses.")
      }


      if (input$qtype == "Miscellaneous"){

        if (input$variable == "none"){
          select_df <-
            cdf %>%
            filter(str_detect(question_text, str_escape(input$question)))
          any_response <- nrow(select_df) > 0

          rdf <- select_df %>%
            count_prop_complete()

          rdf %>%
            ggplot(aes(x = response)) %>%
            stack_freq_prop(title = graphTitle)
        }else{
          select_df <-
            cdf %>%
            filter(str_detect(question_text, str_escape(input$question)))
          any_response <- nrow(select_df) > 0

          rdf <- select_df %>%
            count_prop_complete(.data[[var]])

          rdf %>%
            ggplot(aes(x = response, fill = .data[[var]], group = .data[[var]])) %>%
            stack_freq_prop(title = graphTitle)
        }

      }else{
        select_df <-
          cdf %>%
          filter(str_detect(question_text, str_escape(input$question)))
        any_response <- nrow(select_df) > 0

      if (var == "none"){
        rdf <- select_df %>%
          count_prop_complete()

        rdf %>%
          ggplot(aes(x = response)) %>%
          stack_freq_prop(title = graphTitle)
      }else{
        rdf <- select_df %>%
          count_prop_complete(.data[[var]])

        rdf %>%
          ggplot(aes(x = response, fill = .data[[var]], group = .data[[var]])) %>%
          stack_freq_prop(title = graphTitle)
      }
      }
    },
    height = 600
  ) %>% bindEvent(input$question,input$variable)

  output$race_table <- renderTable(
    {
      select_df <-
        race_ldf
      any_response <- nrow(select_df) > 0

      select_df %>%
        count_prop_complete() %>%
        rename(number = count, percent = prop) %>%
        gt::gt() %>%
        fmt_percent(percent, decimals = 1)

      }

  )

  output$race_plot <- renderPlot(
    {
      select_df <-
        race_ldf
      any_response <- nrow(select_df) > 0

      rdf <- select_df %>%
        count_prop_complete()

      rdf %>%
        ggplot(aes(x = response)) %>%
        stack_freq_prop("")

    }

  )

  output$gender_plot <- renderPlot(
    {
      select_df <-
        gender_ldf
      any_response <- nrow(select_df) > 0

      rdf <- select_df %>%
        count_prop_complete()

      rdf %>%
        ggplot(aes(x = response)) %>%
        stack_freq_prop("")

    }

  )

  output$gender_table <- renderTable(
    {
      select_df <-
        gender_ldf
      any_response <- nrow(select_df) > 0

      select_df %>%
        count_prop_complete() %>%
        rename(number = count, percent = prop) %>%
        gt::gt() %>%
        fmt_percent(percent, decimals = 1)

    }

  )

  output$firstgen_plot <- renderPlot(
    {
      select_df <-
        firstgen_ldf
      any_response <- nrow(select_df) > 0

      rdf <- select_df %>%
        count_prop_complete()

      rdf %>%
        ggplot(aes(x = response)) %>%
        stack_freq_prop("")

    }

  )

  output$firstgen_table <- renderTable(
    {
      select_df <-
        firstgen_ldf
      any_response <- nrow(select_df) > 0

      select_df %>%
        count_prop_complete() %>%
        rename(number = count, percent = prop) %>%
        gt::gt() %>%
        fmt_percent(percent, decimals = 1)

    }

  )

  output$major_plot <- renderPlot(
    {
      select_df <-
        major_ldf
      any_response <- nrow(select_df) > 0

      rdf <- select_df %>%
        count_prop_complete()

      rdf %>%
        ggplot(aes(x = response)) %>%
        stack_freq_prop("")

    }

  )

  output$major_table <- renderTable(
    {
      select_df <-
        major_ldf
      any_response <- nrow(select_df) > 0

      select_df %>%
        count_prop_complete() %>%
        rename(number = count, percent = prop) %>%
        gt::gt() %>%
        fmt_percent(percent, decimals = 1)

    }

  )

  output$international_plot <- renderPlot(
    {
      select_df <-
        international_ldf
      any_response <- nrow(select_df) > 0

      rdf <- select_df %>%
        count_prop_complete()

      rdf %>%
        ggplot(aes(x = response)) %>%
        stack_freq_prop("")

    }

  )

  output$international_table <- renderTable(
    {
      select_df <-
        international_ldf
      any_response <- nrow(select_df) > 0

      select_df %>%
        count_prop_complete() %>%
        rename(number = count, percent = prop) %>%
        gt::gt() %>%
        fmt_percent(percent, decimals = 1)

    }

  )
}

# ************* #
# Run Shiny App #
# ************* #
shinyApp(ui = ui, server = server)
