package org.zerock.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.Criteria;
import org.zerock.domain.PageDTO;
import org.zerock.domain.CommunityVO;
import org.zerock.service.CommunityService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/community/*")
@AllArgsConstructor
public class CommunityController {
	
	private CommunityService communityservice;
	

	// 게시글 등록
	@GetMapping("/register")
	public void register() { //void -> string to change!
		//Request method 'GET' not supported error!!
	}
	
	@PostMapping("/register")
	public String register(CommunityVO community, RedirectAttributes rttr) {
		log.info("register(등록) : " + community);
		
		communityservice.register(community);
		rttr.addFlashAttribute("result", community.getCmbno());		
		return "redirect:/community/list";
	}
	
	// 게시글 페이징 처리 list
	@GetMapping("/list")
	public void list(Criteria cri, Model model) {
		log.info("list : "+cri);
		model.addAttribute("list", communityservice.getList(cri));
		int total = communityservice.getTotal(cri);
		
		log.info("total"+total);
		
		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}
	
	// 게시글 조회
	@GetMapping({"/get", "/modify"})
	public void get(@RequestParam("cmbno") Long cmbno, @ModelAttribute("cri") Criteria cri, Model model) {
		
		log.info("/get 조회 처리");
		log.info("/get or modify 조회 처리");
		model.addAttribute("community", communityservice.get(cmbno));
	}
	
	// 게시글 수정
	@PostMapping("/modify")
	public String modify(CommunityVO community, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		   log.info("modify: 수정 처리" + community);
		   
		   if (communityservice.modify(community)) {
			   rttr.addFlashAttribute("result","success");
		   }
		   
		   rttr.addAttribute("pageNum", cri.getPageNum());
		   rttr.addAttribute("amount", cri.getAmount());	
		   rttr.addAttribute("type", cri.getType());	
		   rttr.addAttribute("keyword", cri.getKeyword());		
		  		   
		   return "redirect:/community/list";
	   }
	   
	// 게시글 삭제
	@PostMapping("/remove")
	public String remove(@RequestParam("cmbno") Long cmbno, 
			@ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		log.info("remove: 삭제 처리 " + cmbno);
		
		if(communityservice.remove(cmbno)) {
			rttr.addFlashAttribute("result", "success");
		}

		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());	
		rttr.addAttribute("type", cri.getType());	
		rttr.addAttribute("keyword", cri.getKeyword());
	
		return "redirect:/community/list";
	}	
}
