package com.petcab.work.call.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.petcab.work.call.model.service.CallService;

import lombok.extern.slf4j.Slf4j;

@Slf4j	
@Controller
@RequestMapping("/book/call")
public class CallController {
	@Autowired
	private CallService service;
	
	@RequestMapping(value = "")
	public ModelAndView checkCallInfo() {
		
	}
	
//	@Autowired
//	private ResourceLoader resourceLoader;
//	
//	@RequestMapping(value = "/list", method = {RequestMethod.GET})
//	public ModelAndView list(
//			ModelAndView model,
//			@RequestParam(value = "page", required = false, defaultValue = "1") int page,
//			@RequestParam(value = "listLimit", required = false, defaultValue = "10") int listLimit) {
//		
//		List<Board> list = null;
//		int boardCount = service.getBoardCount();
//		PageInfo pageInfo = new PageInfo(page, 10, 100, listLimit);		
//		
//		System.out.println(boardCount);
//		
//		list = service.getBoardList(pageInfo);
//		
//		model.addObject("list", list);
//		model.addObject("pageInfo", pageInfo);
//		model.setViewName("board/list");
//		
//		return model;
//	}
//	
//	// 컨트롤러 메소드의 리턴 타입이 void일 경우 Mapping URL을 유츄해서 View를 찾는다.
//	@RequestMapping(value = "/write", method = {RequestMethod.GET})
//	public void writeView() { // 리턴타입을 void로는 거의 쓰지 않는다.
//		
////		return "board/write";
//	}
//	
////	@RequestMapping(value = "/write", method = {RequestMethod.GET})
////	public String writeView() { // 리턴타입을 void로는 거의 쓰지 않는다.
////		
////		return "board/write";
////	}
//	
//	@RequestMapping(value = "/write", method = {RequestMethod.POST})
//	public ModelAndView write(			
//			@SessionAttribute(name = "loginMember", required = false) Member loginMember,
//			HttpServletRequest request, Board board, 
//			@RequestParam("upfile") MultipartFile upfile, ModelAndView model) {
//			
//			// 첨부파일이 여러개일 경우
////			Board board, @RequestParam("upfile") MultipartFile upfile, ModelAndView model) {
//		
//		System.out.println(board);
////		System.out.println(upfile[0].getOriginalFilename());
////		System.out.println(upfile[1].getOriginalFilename());
//		// 파일을 넣지 않으면 : ""
//		// 파일을 넣어주면 : "파일명"
//		System.out.println(upfile.getOriginalFilename());
//	
//		int result = 0;
//		
//		if(loginMember.getUserId().equals(board.getUserId())) {
//			board.setBoardWriteNo(loginMember.getUserNo());
//			
//			if(upfile != null && !upfile.isEmpty()) {
//				// 파일을 저장하는 로직 작성
//				String renameFileName = saveFile(upfile, request);
//				
//				System.out.println(renameFileName);
//				
//				if(renameFileName != null) {
//					board.setBoardOriginalFileName(upfile.getOriginalFilename());
//					board.setBoardRenamedFileName(renameFileName);
//				}
//			}
//			
//			result = service.saveBoard(board);
//			
//			if(result > 0) {
//				model.addObject("msg", "게시글이 정상적으로 등록되었습니다.");
//				model.addObject("location", "/board/list");
//			} else {
//				model.addObject("msg", "게시글 등록을 실패했습니다.");
//				model.addObject("location", "/board/list");
//			}
//			
//		} else {
//			model.addObject("msg", "잘못된 접근입니다.");
//			model.addObject("location", "/");
//		}
//		
////		model.setViewName("board/write");
//		model.setViewName("common/msg");
//		
//		return model;
//	}
//	
//	@RequestMapping(value = "/view", method = { RequestMethod.GET })
//	public ModelAndView view(@RequestParam("boardNo") int boardNo, ModelAndView model) {
//		Board board = service.findBoardByNo(boardNo);
//		
//		model.addObject("board", board);
//		model.setViewName("board/view");
//		
//		return model;
//	}
//	
//	/*
//	 * HttpEntity
//	 * 	- SpringFramework에서 제공하는 클래스로 HTTP 요청 또는 응답에 해당하는 HTTP Header와 HTTP Body를 포함하는 클래스이다.
//	 * 
//	 * ResponseEntity
//	 * 	- HttpEntity를 상속하는 클래스로 HTTP 응답 데이터를 포함하는 클래스이다. 
//	 * 	- 개발자 직접 HTTP Body, Header, status code를 세팅하여 반환할 수 있다.
//	 * 	- 기본적으로 컨트롤러의 리턴값은 View의 이름을 반환함으로써 ViewResolver에서 해당 View를 렌더링하게 되는데
//	 * 	컨트롤러에서 ResponseEntity를 리턴하게되면 View에 대한 정보가 아닌 HTTP 정보를 반환하게 된다. 
//	 * 	- 해당 객체를 반환해주면 클라이언트 측에서 HTTP 정보를 받을 수 있게된다.
//	 * 
//	 * @ResponseBody와의 차이점
//	 * 	- @ResponseBody나 ResponseEntity를 리턴하는 것은 결과적으로 같은 기능이지만 구현 방법이 다르다.
//	 * 	- header 값을 변경시켜야 할 경우에는 @ResponseBody의 경우 파라미터로 Response 객체를 받아서 이 객체가 header를 변경시켜야한다.
//	 * 	- ResponseEntity에서는 객체를 생성한뒤 객체에서 header 값을 변경시키면된다.
//	 */
//	
//	@RequestMapping(value="fileDown", method = { RequestMethod.GET })
//	public ResponseEntity<Resource> fileDown(
//		@RequestParam("oriname") String oriname, @RequestParam("rename") String rename,
//		@RequestHeader(name = "user-agent") String header) {
//				
//		try {
//			Resource resource = resourceLoader.getResource("resources/upload/board/" + rename);
//			File file  = resource.getFile();
//			boolean isMSIE = header.indexOf("Trident")!=-1||header.indexOf("MSIE")!=-1;
//			String encodeRename = "";
//
////			if(file.exists()) {
////				return ResponseEntity.badRequest().build();
////			}
//			
//			if(isMSIE) {
//				encodeRename = URLEncoder.encode(oriname, "UTF-8");
//				encodeRename = encodeRename.replaceAll("\\+", "%20");
//			}else {
//				encodeRename = new String(oriname.getBytes("UTF-8"),"ISO-8859-1");
//			}
//			
//			return ResponseEntity.ok()
//					.header(HttpHeaders.CONTENT_DISPOSITION, "attachment;filename=\"" + encodeRename +"\"")
//					.header(HttpHeaders.CONTENT_LENGTH, String.valueOf(file.length()))
//					.header(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_OCTET_STREAM.toString())
//					.body(resource);
//			
//		} catch (IOException e) {
//			e.printStackTrace();
//			
//			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
//		}		
//	}
//	
//	@RequestMapping(value = "/update", method = { RequestMethod.GET })
//	public ModelAndView updateView(@RequestParam("boardNo") int boardNo, ModelAndView model) {
//		Board board = service.findBoardByNo(boardNo);
//		
//		model.addObject("board", board);
//		model.setViewName("board/update");
//		
//		return model;
//	}
//	
//	@RequestMapping(value = "/update", method = { RequestMethod.POST })
//	public ModelAndView update(
//			@SessionAttribute(name = "loginMember", required = false) Member loginMember,
//			@RequestParam("reloadFile") MultipartFile reloadFile, HttpServletRequest request,
//			Board board, ModelAndView model) {
//		
//		int result = 0;
//		
//		if(loginMember.getUserId().equals(board.getUserId())) {
//			if(reloadFile != null && !reloadFile.isEmpty()) {
//				if(board.getBoardRenamedFileName() != null) {
//					deleteFile(board.getBoardRenamedFileName(), request);					
//				}
//				
//				String renameFileName = saveFile(reloadFile, request);
//				
//				if(renameFileName != null) {
//					board.setBoardOriginalFileName(reloadFile.getOriginalFilename());
//					board.setBoardRenamedFileName(renameFileName);
//				}
//			}
//			
//			result = service.saveBoard(board);
//			
//			if(result > 0) {
//				model.addObject("msg", "게시글이 정상적으로 수정되었습니다.");
//				model.addObject("location", "/board/update?boardNo=" + board.getBoardNo());
//			} else {
//				model.addObject("msg", "게시글 수정을 실패했습니다.");
//				model.addObject("location", "/board/list");
//			}
//			
//		} else {
//			model.addObject("msg", "잘못된 접근입니다.");
//			model.addObject("location", "/");
//		}
//		
//		model.setViewName("common/msg");
//		
//		return model;
//	}
//
//	private void deleteFile(String fileName, HttpServletRequest request) {
//		String rootPath = request.getSession().getServletContext().getRealPath("resources");
//		String savePath = rootPath + "/upload/board";
//		
//		log.debug("Root Path : " + rootPath);
//		log.debug("Save Path : " + savePath);
//		
//		File file = new File(savePath + "/" + fileName);
//		
//		if(file.exists()) { // 존재여부 확인
//			file.delete();
//		}
//	}
//
//	// 보통 파일은 프로젝트 내부가 아닌 서버에 넣는다.
//	private String saveFile(MultipartFile file, HttpServletRequest request) {
//		String renamePath = null;
//		String originalFileName = null;
//		String renameFileName = null; 
//		String rootPath = request.getSession().getServletContext().getRealPath("resources");
//		String savePath = rootPath + "/upload/board";
//
//		log.debug("Root Path : " + rootPath);
//		log.debug("Save Path : " + savePath);
//		
//		// Save Path가 실제로 존재하지 않으면 폴더를 생성하는 로직
//		File folder = new File(savePath);
//		
//		if(!folder.exists()) {
//			folder.mkdirs();
//		}
//		
//		originalFileName = file.getOriginalFilename();
//		// 확장자가 없으면 삼항연산자로 예외처리
//		renameFileName = 
//				LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyyMMdd_HHmmssSSSS")) + 
//				originalFileName.substring(originalFileName.lastIndexOf("."));
//		renamePath = savePath + "/" + renameFileName;
//		
//		try {
//			// 업로드 한 파일 데이터를 지정한 파일에 저장한다.
//			file.transferTo(new File(renamePath));
//		} catch (IOException e) {
//			System.out.println("파일 전송 에러 : " + e.getMessage());
//			e.printStackTrace();
//		}
//		
//		return renameFileName;
//	}

}
