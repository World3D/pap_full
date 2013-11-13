--�и���İ鵱

--MisDescBegin
x214011_g_ScriptId = 214011
--x214011_g_MissionIdPre =87
x214011_g_MissionId = 118
x214011_g_MissionKind = 3
x214011_g_MissionLevel = 15
--x214011_g_ScriptIdNext = {ScriptId = 205005 ,LV = 1 }
x214011_g_Name	="����" 
x214011_g_DemandItem ={{id=13010038,num=1}}
x214011_g_noDemandKill ={{id=366,num=1}}	

x214011_g_MissionName="�и���İ鵱"
x214011_g_MissionInfo="    "  --��������
x214011_g_MissionInfo2="С�ֵܣ�����˵����Ĵ���������������棬������Ӣ�۳����ꡣ������ľ�溢����������ЩӢ�۸����������ϻ���ο����\n \n    ����������һ�����ܣ���ľ��׼����������Ϊ���и���İ鵱����������Ϊ��ľ�����˵�ʱ��������������ӵ�������ˮ����ҹ������\n \n     ������������̫����ˣ�����������˵˵���°ɣ����������ȥ������������#c0080C0��������ͷ#W����������������ľ�ϴ�Ӫ��������Ҫ������ͷ������ҵ����档"
x214011_g_MissionTarget="    ����ľ�ϸ����ҵ�����������#R�����#W��������ͷ�û�����#G����#W��"		
x214011_g_MissionComplete="    �������ۣ������ڿ���Ϊ���游�����ˣ�"					--�������npc˵���Ļ�
x214011_g_ContinueInfo="    ����������������ҵĳ��ˣ���һ��Ҫ�õ�������ͷ��"
--������
x214011_g_MoneyBonus = 600
--�̶���Ʒ���������8��
x214011_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x214011_g_RadioItemBonus={{id=10226002,num=1},{id=10206002,num=1}}

--MisDescEnd
x214011_g_ExpBonus = 6500
--**********************************

--������ں���

--**********************************

function x214011_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x214011_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x214011_g_MissionId) > 0 then
		if x214011_CheckSubmit(sceneId, selfId, targetId) <= 0 then
                        BeginEvent(sceneId)
			AddText(sceneId,"#Y"..x214011_g_MissionName)
			AddText(sceneId,x214011_g_ContinueInfo)
		        AddText(sceneId,"#Y����Ŀ��#W") 
			AddText(sceneId,x214011_g_MissionTarget) 
			AddText(sceneId,format("\n    ��������ͷ   %d/%d", LuaFnGetItemCount(sceneId,selfId,x214011_g_DemandItem[1].id),x214011_g_DemandItem[1].num ))
			EndEvent()
			DispatchEventList(sceneId, selfId, targetId)
		end

		     
                if x214011_CheckSubmit(sceneId, selfId, targetId) > 0 then
                     BeginEvent(sceneId)
                     AddText(sceneId,"#Y"..x214011_g_MissionName)
		     AddText(sceneId,x214011_g_MissionComplete)
		     AddText(sceneId,"#Y��Ҫ��Ʒ#W") 
		     --for i, item in pairs(x214011_g_DemandItem) do  
		     --AddItemBonus(sceneId, item.id, item.num)
		     --end
		     AddMoneyBonus(sceneId, x214011_g_MoneyBonus)
		     for i, item in pairs(x214011_g_ItemBonus) do
	             	AddItemBonus(sceneId, item.id, item.num)
	             end
		     for i, item in pairs(x214011_g_RadioItemBonus) do
	            	 AddRadioItemBonus(sceneId, item.id, item.num)
	             end
		     EndEvent()
                     DispatchMissionContinueInfo(sceneId, selfId, targetId, x214011_g_ScriptId, x214011_g_MissionId)
                end

        elseif x214011_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x214011_g_MissionName)
                AddText(sceneId,x214011_g_MissionInfo..GetName(sceneId, selfId)..x214011_g_MissionInfo2) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x214011_g_MissionTarget) 
		AddMoneyBonus(sceneId, x214011_g_MoneyBonus)	
		for i, item in pairs(x214011_g_ItemBonus) do
	             	AddItemBonus(sceneId, item.id, item.num)
	        end
		for i, item in pairs(x214011_g_RadioItemBonus) do
	            	 AddRadioItemBonus(sceneId, item.id, item.num)
	        end	
		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x214011_g_ScriptId, x214011_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x214011_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x214011_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x214011_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x214011_g_ScriptId, x214011_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x214011_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x214011_g_Name) then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x214011_CheckPushList(sceneId, selfId, targetId)
        if (sceneId==14) then
        	         return 1
        end
        return 0
	
end

--**********************************

--����

--**********************************

function x214011_OnAccept(sceneId, selfId)

	                                                  
		        BeginEvent(sceneId)
			AddMission( sceneId, selfId, x214011_g_MissionId, x214011_g_ScriptId, 1, 0, 0)
			AddText(sceneId,"��������"..x214011_g_MissionName) 
			EndEvent()
			DispatchMissionTips(sceneId, selfId)                   
	                                                                     
	     
end



--**********************************

--����

--**********************************

function x214011_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x214011_g_MissionId)
	for i, item in pairs(x214011_g_DemandItem) do
		DelItem(sceneId, selfId, item.id, item.num)
	end

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x214011_CheckSubmit( sceneId, selfId, targetId)

	if LuaFnGetItemCount(sceneId,selfId,x214011_g_DemandItem[1].id) == x214011_g_DemandItem[1].num then
	        return 1
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x214011_OnSubmit(sceneId, selfId, targetId, selectRadioId)

		BeginAddItem(sceneId)                                                    
			for i, item in pairs(x214011_g_ItemBonus) do                    
				AddItem( sceneId,item.id, item.num )             
			end                                                      
			for i, item in pairs(x214011_g_RadioItemBonus) do               
				if item.id == selectRadioId then                 
					AddItem( sceneId,item.id, item.num )     
				end                                              
			end                                                      
		ret = EndAddItem(sceneId,selfId)                                 
		if ret > 0 then                                                  
		  ret = DelMission( sceneId, selfId, x214011_g_MissionId ) 
			if ret > 0 then                                   
				MissionCom( sceneId,selfId, x214011_g_MissionId )
				AddExp(sceneId, selfId, x214011_g_ExpBonus)   
	                        AddMoney(sceneId, selfId, x214011_g_MoneyBonus)
	                        AddItemListToHuman(sceneId,selfId)
			end                                               
		else                                                             
			BeginEvent(sceneId)                                      
				AddText(sceneId,"��Ʒ����������������������");                        
			EndEvent(sceneId)                                        
			DispatchMissionTips(sceneId,selfId)                      
		end   
		--CallScriptFunction( x214011_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
	

	
end



--**********************************

--ɱ����������

--**********************************

function x214011_OnKillObject(sceneId, selfId, objdataId)
	 if IsHaveMission(sceneId, selfId, x214011_g_MissionId) >= 0 then                                       
       		 if objdataId == x214011_g_noDemandKill[1].id then 
       		    if LuaFnGetItemCount(sceneId,selfId,x214011_g_DemandItem[1].id) < x214011_g_DemandItem[1].num then
       		         if random(1,100)>0 then
       		        	 BeginAddItem(sceneId)                                                    
				 AddItem( sceneId,x214011_g_DemandItem[1].id, 1 )             
				 ret = EndAddItem(sceneId,selfId)                                 
		        	 if ret > 0 then                                                  
		        	 	BeginEvent(sceneId)
				 	AddText(sceneId,format("��������ͷ   %d/%d", LuaFnGetItemCount(sceneId,selfId,x214011_g_DemandItem[1].id)+1,x214011_g_DemandItem[1].num )) 
				 	EndEvent()
				 	DispatchMissionTips(sceneId, selfId)
				 	AddItemListToHuman(sceneId,selfId) 
		        	 else                                                             
		        	 	BeginEvent(sceneId)                                      
				     	AddText(sceneId,"��Ʒ��������")                    
				        EndEvent(sceneId)                                        
				        DispatchMissionTips(sceneId,selfId) 
				 end                     
		         end             
       		    end
       		 end
       		 
       		 
      end  

end



--**********************************

--���������¼�

--**********************************

function x214011_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x214011_OnItemChanged(sceneId, selfId, itemdataId)

end

