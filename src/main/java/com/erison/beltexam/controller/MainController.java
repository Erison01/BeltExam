package com.erison.beltexam.controller;

import com.erison.beltexam.models.Tab;
import com.erison.beltexam.models.User;
import com.erison.beltexam.models.UserLogin;
import com.erison.beltexam.services.TabService;
import com.erison.beltexam.services.UserService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

@Controller
public class MainController {

    @Autowired
    private UserService userService;

    @Autowired
    private TabService tabService;


    @GetMapping("/")
    public String home(Model model , @ModelAttribute( "newUser") User newUser,
                       @ModelAttribute("newLogin")User newLogin , HttpSession session){
        Long loggedInUserId = (Long) session.getAttribute("loggedInUserId");
        if (loggedInUserId!=null){
            return "redirect:/home";
        }
        model.addAttribute("newUser",new User());
        model.addAttribute("newLogin",new UserLogin());
        return "index";
    }

    @PostMapping("/register")
    public String register(@Valid @ModelAttribute("newUser")User newUser , BindingResult result,
                           Model model, HttpSession session){
        userService.register(newUser,result);
        if (result.hasErrors()){
            model.addAttribute("newLogin",new UserLogin());
            return "index";
        }
        session.setAttribute("loggedInUserId",newUser.getId());
        return "redirect:/home";
    }

    @PostMapping("/login")
    public String login(@Valid @ModelAttribute("newLogin") UserLogin newLogin, BindingResult result
            , Model model, HttpSession session){
        User user = userService.login(newLogin,result);
        if (result.hasErrors()){
            model.addAttribute("newUser",new User());
            return "index";
        }
        session.setAttribute("loggedInUserId",user.getId());
        return "redirect:/home";
    }

    @RequestMapping("/home")
    public String dashboard(HttpServletRequest request, HttpServletResponse response, HttpSession session, Model model){
        Long loggedInUserId = (Long) session.getAttribute("loggedInUserId");
        if (loggedInUserId == null){
            return "redirect:/";
        }
        User loggedInUser = userService.findUser(loggedInUserId);
        model.addAttribute("user",loggedInUser);
        model.addAttribute("tables",tabService.allOrderdTables(loggedInUser));

        // this code prevent user going back at dashboard after logout

        response.setHeader("Cache-Control", "no-store, no-cache, must-revalidate");
        response.setHeader("Pragma", "no-cache");
        response.setHeader("Expires", "0");
        return "home";
    }

    @GetMapping("/tables/new")
    public String newTable(@ModelAttribute("newTable") Tab table, HttpSession session){
        if(session.getAttribute("loggedInUserId") == null){
            return "redirect:/";
        }

        return "newT";
    }

    @PostMapping("/tables/new")
    public String saveTable(@Valid @ModelAttribute("newTable") Tab table,
                           BindingResult result, HttpSession session){
        if(result.hasErrors()){
            return "newT";
        }
        User loggedInUser = userService.findUser((Long) session.getAttribute("loggedInUserId"));
        table.setUser(loggedInUser);
        tabService.save(table);

        return "redirect:/home";
    }

    @GetMapping("/tables")
    public String all(Model model,HttpSession session){
    if(session.getAttribute("loggedInUserId")==null){
        return "redirect:/";
    }
        model.addAttribute("allT",tabService.UnnasignmentTables());
        return "allTab";
    }

    @GetMapping("/tables/{tableId}/edit")
    public String edit(@PathVariable(name = "tableId")Long tableId,
                                 Model model, HttpSession session){
        if(session.getAttribute("loggedInUserId") == null){

            return "redirect:/";
        }
        model.addAttribute("table", tabService.findByID(tableId));

        return "edit";
    }

    @PutMapping("/tables/{tableId}/edit")
    public String update(@Valid @ModelAttribute("table")Tab table,
                            @PathVariable(name = "tableId")Long tableId,
                            BindingResult result, HttpSession session){
        if (result.hasErrors()){
            return "edit";
        }
        table.setId(tableId);
        table.setUser(userService.findUser((Long) session.getAttribute("loggedInUserId")));
        tabService.update(table);

        return "redirect:/home";
    }

    @RequestMapping("/delete/{tableId}")
    public String delete(@PathVariable(name = "tableId")Long tableId){
        Tab table = tabService.findByID(tableId);
        if (table != null) {


            tabService.delete(table);
        }
        return "redirect:/home";
    }

    @RequestMapping("/giveup/{tableId}")
    public String giveUpTable(@PathVariable(name = "tableId")Long tableId){
        Tab table = tabService.findByID(tableId);

        table.setUser(null);
        tabService.save(table);

        return "redirect:/home";
    }

    @RequestMapping("/pickup/{tableId}")
    public String pickUpTable(@PathVariable(name = "tableId")Long tableId, HttpSession session){
        Tab table = tabService.findByID(tableId);

        table.setUser(userService.findUser((Long) session.getAttribute("loggedInUserId")));
        tabService.save(table);

        return "redirect:/home";
    }



    @RequestMapping("/logout")
    public String logout (HttpServletRequest request, HttpSession session ){
        session.invalidate();

        return "redirect:/";
    }
}

